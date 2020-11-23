require 'json'

file = __dir__ + '/../../problem-specifications/exercises/leap/canonical-data.json'
j = JSON.parse(File.read(file))
j['cases'].each { |c|
  puts <<~V

    fn test_#{c['description'].downcase.delete(?,).gsub(' ', ?_)}() {
        assert #{?! unless c['expected']}leap(#{c['input']['year']})
    }
  V
}
