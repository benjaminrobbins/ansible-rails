# frozen_string_literal: true

require 'vagrant'
require 'yaml'

module FTL
  class Config
    def initialize(root_path:)
      @root_path = root_path
    end

    def site_host
      content['site_host_canonical']
    end

    def site_hosts_redirects
      @site_hosts_redirects ||= content['site_host_redirects']
    end

    def site_hosts
      @site_hosts ||= [site_host] + site_host_redirects
    end

    # def wordpress_sites
    #   @wordpress_sites ||= begin
    #     content['wordpress_sites'].tap do |sites|
    #       fail_with message: "No sites found in #{path}." if sites.to_h.empty?
    #     end
    #   end
    # end

    def content
      @content ||= begin
        fail_with message: "#{path} was not found. Please check `root_path`." unless exist?
        YAML.load_file(path)
      end
    end

    private

    def exist?
      File.exist?(path)
    end

    def path
      File.join(@root_path, 'group_vars', 'development', 'site.yml')
    end

    # def template_content
    #   File.read(File.join(@root_path, 'roles', 'common', 'templates', 'site_hosts.j2')).sub!('{{ env }}', 'development').gsub!(/com$/, 'dev')
    # end

    def fail_with(message:)
      raise Vagrant::Errors::VagrantError.new, message
    end
  end
end
