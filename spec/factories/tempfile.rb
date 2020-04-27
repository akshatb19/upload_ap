include ActionDispatch::TestProcess

FactoryBot.define do
  factory :abc_txt, :class => "Tempfile" do

    to_create {}

      path      { Rails.root.join("spec/fixtures/abc.txt") }
      mime_type { "text/plain" }
      binary    { false }

    initialize_with { fixture_file_upload(path, mime_type, binary) }

  end
end
