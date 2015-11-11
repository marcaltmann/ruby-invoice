require 'output_object'

describe OutputObject do
  let(:output_object) { OutputObject.new }

  it 'should output its argument on success' do
    expect { output_object.success('some stuff') }
      .to output("Success!\n\"some stuff\"\n").to_stdout
  end

  it 'should output its argument on failure' do
    expect { output_object.failure('some stuff') }
      .to output("Failure!\n\"some stuff\"\n").to_stderr
  end
end
