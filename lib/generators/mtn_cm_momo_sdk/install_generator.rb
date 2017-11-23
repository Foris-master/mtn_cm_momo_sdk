require 'rails/generators'

module MtnCmMomoSdk
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root(File.expand_path(File.dirname(__FILE__)))

      def copy_initializer
        copy_file 'mtn_cm_momo.rb', 'config/initializers/mtn_cm_momo.rb'
      end
    end
  end
end