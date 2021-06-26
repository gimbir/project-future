import os
from google.cloud import translate_v2 as translate
import json
from project_future.wsgi import *
from main.models import Languages

# os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = r'CloudVisionServiceAccountToken.json'
# translate_client = translate.Client()

# results = translate_client.get_languages()


# langs = []
# for i in range(len(results)):
#     langs.append(
#         {
#             "language": results[i]['language'],
#             "name": results[i]['name'],
#         }
#     )

# with open("langs.json", "w") as out:
#     json.dump(langs, out)

with open("langs.json", "r") as out:
    langs = json.load(out)

for i in range(len(langs)):
    Languages.objects.create(language=langs[i]['language'], name=langs[i]['name'])

print(langs)
