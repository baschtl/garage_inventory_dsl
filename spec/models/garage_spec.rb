RSpec.describe GarageInventory::Models::Garage do

  describe '#initialize' do

    subject { described_class.new(options) }

    context "with default options" do

      let(:options) { {} }

      its(:name)     { is_expected.to eq('') }
      its(:size)     { is_expected.to eq(0) }
      its(:capacity) { is_expected.to eq(0) }
      its(:rooms)    { is_expected.to be_empty }

    end

    context "with custom options" do

      let(:options) { { name: 'my_garage', size: 10, capacity: 3 } }

      its(:name)     { is_expected.to eq(options[:name]) }
      its(:size)     { is_expected.to eq(options[:size]) }
      its(:capacity) { is_expected.to eq(options[:capacity]) }
      its(:rooms)    { is_expected.to be_empty }

    end

  end

  describe '#room' do

    let(:garage)  { described_class.new }
    let(:options) { {} }

    subject { garage.room(options) }

    it "adds a new item" do
      expect {
        subject
      }.to change { garage.rooms.size }.by(1)
    end

    it "adds a new item of type garage" do
      subject

      expect(garage.rooms.first).to be_an_instance_of(GarageInventory::Models::Room)
    end

    context "added item" do

      let(:added_garage)      { subject.first }
      let(:actual_attributes) { { name: added_garage.name, size: added_garage.size, capacity: added_garage.capacity } }

      it "has the expected options set" do
        pending
        expect(actual_attributes).to eq(options)
      end

    end

  end

end
