include ActionDispatch::TestProcess

FactoryBot.define do
  factory :chargeback_csv, :class => "Tempfile" do

    to_create {}

      path      { Rails.root.join("spec/fixtures/chargeback_test.csv") }
      mime_type { "text/csv" }
      binary    { false }

    initialize_with { fixture_file_upload(path, mime_type, binary) }

  end
end
