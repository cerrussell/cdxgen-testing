import csv
import json
import os
from pathlib import Path

from custom_json_diff.custom_diff import compare_dicts, get_common, get_diffs, perform_bom_diff

with open('/home/runner/work/cdxgen-testing/cdxgen-testing/test/diff/repos.csv', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    repo_data = list(reader)

Failed = False

for i in repo_data:
    bom_file = f'{i["project"]}-bom.json'
    bom_1 = str(Path("/home/runner/work/samples", bom_file))
    bom_2 = str(Path("/home/runner/work/cdxgen-samples", bom_file))
    if not os.path.exists(bom_1):
        print(f'{bom_file} does not exist in cdxgen-samples repository.')
        continue
    result, j1, j2 = compare_dicts(bom_1, bom_2, preset="cdxgen-extended")
    if result == 0:
        print(f'{i["project"]} BOM passed.')
    else:
        print(f'{i["project"]} BOM failed.')
        Failed = True
        common = get_common(j1, j2)
        diffs = get_diffs(bom_1, bom_2, j1, j2)
        bom_diffs = perform_bom_diff(result, diffs, common, bom_1, bom_2, f'/home/runner/work/cdxgen-samples/{i["project"]}_diffs.json')
