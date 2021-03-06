require File.join(File.dirname(__FILE__), "../generators_support")

class ControllerGenerator < RubiGen::Base
  include GeneratorsSupport

  default_options :author => nil

  attr_reader :name

  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @name = args.shift
    extract_options
  end

  def manifest
    record do |m|
      build_controller_templates(m)
    end
  end

  protected
    def banner
      <<-EOS
Creates a RuGUI controller.

USAGE: script/generate controller YOUR_CONTROLLER_NAME
EOS
    end

    def add_options!(opts)
      controller_add_options!(opts)
    end
end
