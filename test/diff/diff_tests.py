import json

from custom_json_diff.custom_json_diff import sort_dict


# @pytest.fixture
def sample_bom(json_file):
    with open(json_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    return sort_dict(data)


def test_java_bom():
    assert sample_bom('test/diff/java-sec-code-bom.json') == sample_bom('/home/runner/work/cdxgen-samples/java-sec-code-bom.json')

