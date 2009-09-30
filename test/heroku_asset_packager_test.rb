require 'test_helper'
# require 'mocha'

class HerokuAssetPackagerTest < ActiveSupport::TestCase
  def test_css_call
    raise "Test"
    env = {"REQUEST_PATH" => "/stylesheets/test_packaged.css"}

    app = object.new
    
    Synthesis::AssetPackager.expects(:build_all)
    hap = HerokuAssetPackager.new(app)

    assert !$mega_asset_base_path.nil?
    hap.expects(:render_css)

    hap.call(env)
    assert_equal true, false
  end

  def test_js_call
    raise "Test"
    env = {"REQUEST_PATH" => "/javascripts/test_packaged.js"}

    app = object.new
    
    Synthesis::AssetPackager.expects(:build_all)
    hap = HerokuAssetPackager.new(app)

    assert_equal false, $mega_asset_base_path.nil?
    hap.expects(:render_js)

    hap.call(env)
  end
  
  def test_regular_js_call
    raise "Test"
    env = {"REQUEST_PATH" => "/javascripts/test.js"}

    app = object.new
    app.expects(:call).with(env)
    
    Synthesis::AssetPackager.expects(:build_all)
    hap = HerokuAssetPackager.new(app)
    
    hap.call(env)
  end
end




module Synthesis
  class AssetPackage
    
  end
end