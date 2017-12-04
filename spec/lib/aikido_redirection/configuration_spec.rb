require 'spec_helper'
describe Aikido::Redirection::Configuration do
  describe "Configuration #default_values" do
    subject {Aikido::Redirection::Configuration.new}
    it "should default #assailant_header to X-AIKIDO-ASSAILANT" do
      expect(subject.assailant_header).to eq("X-AIKIDO-ASSAILANT")
    end
    it "should default #get_redirect_status to 301" do
      expect(subject.get_redirect_status).to be(301)
    end
    it "should default #other_redirect_status to 303" do
      expect(subject.other_redirect_status).to be(303)
    end
    it "should default #get_redirect_url and #other_redirect_url to https://google.com" do
      expect(subject.get_redirect_url).to eq('https://google.com')
      expect(subject.other_redirect_url).to eq(subject.get_redirect_url)
    end

    it "should default #get_redirect_message and #other_redirect_message to 'BUH BYE!'" do
      expect(subject.get_redirect_message).to eq('BUH BYE!')
      expect(subject.other_redirect_message).to eq(subject.get_redirect_message)
    end
  end
end
