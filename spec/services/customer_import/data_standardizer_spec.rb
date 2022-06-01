describe CustomerImport::DataStandardizer do
  describe ".standardize_length" do
    it "converts input to an integer" do
      expect(described_class.standardize_length("24’")).to eq(24)
      expect(described_class.standardize_length("32 ft")).to eq(32)
      expect(described_class.standardize_length("5 feet")).to eq(5)
    end
  end

  describe ".standardize_kind" do
    it "downcases kind" do
      expect(described_class.standardize_kind("RV")).to eq("rv")
    end
  end

  describe "#run" do
    it "converts pipe column separators to commas" do
      expect(described_class.new("1|2|3|4").run).to eq("1,2,3,4")
    end

    it "forces UTF-8 encoding" do
      ascii_8bit_data = "1|2|3|4".encode(Encoding::ASCII_8BIT)
      encoding = described_class.new(ascii_8bit_data).run.encoding

      expect(encoding).to eq(Encoding::UTF_8)
    end
  end
end
