require 'journono/target_modules/rss_target'

module Journono
  module TargetModule
    RSS = 0
    CLASSES = {RSS => 'RSSModule'}

    def self.get_module(inst)
      module_name ='Journono::TargetModule::' + self.get_class(inst.module_class)
      class_name = module_name.constantize
      return class_name.new
    end

    private
    def self.get_class(module_key)
      if CLASSES.has_key?(module_key)
        return CLASSES[module_key]
      end
      return nil
    end

  end
end