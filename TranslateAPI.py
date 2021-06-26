import os, io
from google.cloud import translate_v2 as translate

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = r'CloudVisionServiceAccountToken.json'

translate_client = translate.Client()


def translate(text, target):
    output = translate_client.translate(
        text, target_language=target, source_language='en'
    )
    return output['translatedText']
