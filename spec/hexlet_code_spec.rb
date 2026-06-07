# frozen_string_literal: true

RSpec.describe HexletCode do
  it "has a version number" do
    expect(HexletCode::VERSION).not_to be nil
  end
end

RSpec.describe HexletCode::Tag do
  describe ".build" do
    context "with single tags" do
      it "builds a tag without attributes" do
        expect(described_class.build("br")).to eq("<br>")
      end

      it "builds a tag with attributes" do
        expect(described_class.build("img", src: "path/to/image"))
          .to eq('<img src="path/to/image">')
      end

      it "builds a tag with multiple attributes" do
        expect(described_class.build("input", type: "submit", value: "Save"))
          .to eq('<input type="submit" value="Save">')
      end
    end

    context "with paired tags" do
      it "builds an empty paired tag without a block" do
        expect(described_class.build("div")).to eq("<div></div>")
      end

      it "builds a paired tag with a block body" do
        expect(described_class.build("label") { "Email" })
          .to eq("<label>Email</label>")
      end

      it "builds a paired tag with attributes and a block body" do
        expect(described_class.build("label", for: "email") { "Email" })
          .to eq('<label for="email">Email</label>')
      end
    end
  end
end
