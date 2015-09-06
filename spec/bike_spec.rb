require "Bike"

describe Bike do
  it "responds to working" do
    expect(subject).to be_working
  end

  it "is working when created" do
    expect(Bike.new.working?).to eq true
  end

  it "responds to report_broken" do
    expect(subject).to respond_to :report_broken
  end
end
