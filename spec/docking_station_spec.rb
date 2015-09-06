require "docking_station"

describe DockingStation do
  it "responds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  describe "#release_bike" do
    it "releases bikes" do
    #  expect(subject.release_bike).to be_an_instance_of Bike
      bike = Bike.new
      subject.dock bike
      expect(subject.release_bike bike).to be_working
    end

    it "raises an error when asked to release a broken bike" do
      bike = Bike.new
      bike.report_broken
      subject.dock bike
      expect { subject.release_bike bike }.to raise_error "Bike is broken"
    end
  end

  it "raises an error when there is no bike" do
    expect { subject.release_bike () }.to raise_error "No bike available"
  end

  it "responds to dock" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "raises an error when dock is full" do
    subject.capacity.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error "Docking station is full"
  end

  describe "#capacity" do
    it "has a default capacity" do
      expect(subject.capacity).to eq DockingStation::CAPACITY
    end
  end
end
