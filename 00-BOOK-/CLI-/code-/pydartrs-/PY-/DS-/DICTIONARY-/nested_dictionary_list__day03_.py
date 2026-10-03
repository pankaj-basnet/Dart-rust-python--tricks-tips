_CATEGORY_LABELS_BY_QID = {
    "Q1084": "Noun"
}

_FEATURE_LABELS_BY_QID = {
    "Q1107": "Infinitive", "Q110786":"singular"
}

json_entity_data = {
       
      "id": "L12345",
      "type": "lexeme",
      "lemmas": {
        "dag": {
          "language": "dag",
          "value": "saha"
        }
      },
      "lexicalCategory": "Q1084",
      "senses": [
        {
          "id": "L12345-S1",
          "glosses": {
            "dag": { "language": "dag", "value": "saha" },
            "en": { "language": "en", "value": "time / hour" }
          },
          "claims": {
            "P18": [
              {
                "mainsnak": {
                  "datavalue": {
                    "value": "Clock.jpg"
                  }
                }
              }
            ]
          }
        }
      ],
      "forms": [
        {
          "id": "L12345-F1",
          "representations": {
            "dag": { "language": "dag", "value": "saha" }
          },
          "grammaticalFeatures": ["Q110786"]
        }
      ]
    
    }

def get_image_url(sense):
    url_p18 = sense.get("claims", {}).get("P18", [])[0]
    url = url_p18.get("mainsnak", {}).get("datavalue", {}).get("value", "")
    url_final = "www.wikidata.org/photo/{url}"


def parse_single_entity(entity_data):
    """Parses a raw entity dictionary into a simplified output structure."""
    
    wikidata_id = entity_data.get("id", "")
    
    lemmas = entity_data.get("lemmas", {})
    dag_lemma = lemmas.get("dag", {})
    headword = dag_lemma.get("value", "")
    
    category_qid = entity_data.get("lexicalCategory", "")
    part_of_speech = _CATEGORY_LABELS_BY_QID.get(category_qid, category_qid)

    # Process Senses
    senses_list = []
    for index, sense in enumerate(entity_data.get("senses", [])):
        sense_id = sense.get("id", "")
        dag_gloss = sense.get("glosses", {}).get("dag", {}).get("value", "")
        en_gloss = sense.get("glosses", {}).get("en", {}).get("value", "")
        
        senses_list.append({
            "sense_wikidata_id": sense_id,
            "english_gloss": en_gloss,
            "dag_gloss" : dag_gloss,
            "order": index
        })

    # Process Forms
    forms_list = []
    for form in entity_data.get("forms", []):
        dag_rep = form.get("representations", {}).get("dag", {})
        dag_text = dag_rep.get("value", "")
        
        feature_qids = form.get("grammaticalFeatures", [])
        features = [_FEATURE_LABELS_BY_QID.get(qid, qid) for qid in feature_qids]
        
        forms_list.append({
            "dag_text": dag_text,
            "feature_labels": ",".join(features)
        })

    return {
        "wikidata_id": wikidata_id,
        "headword": headword,
        "part_of_speech": part_of_speech,
        "wikidata_url": f"https://www.wikidata.org/wiki/Lexeme:{wikidata_id}",
        "senses": senses_list,
        "forms": forms_list,
    }



raw_mock_json = {
    "id": "L1005",
    "lemmas": {"dag": {"value": "Kpɛibu"}},
    "lexicalCategory": "Q1084",
    "senses": [{"id": "S1", "glosses": {"en": {"value": "To enter or entry"}}}],
    "forms": [{"representations": {"dag": {"value": "Kpɛi"}}, "grammaticalFeatures": ["Q1107"]}]
}

intermediate_output = parse_single_entity(raw_mock_json)
print(intermediate_output)


## 4. Intermediate Output (JSON Format)

# When the function processes the raw input data above, the resulting structured output dictionary looks like this in JSON format:

# OUTPUT
# {
#   "wikidata_id": "L1005",
#   "headword": "Kpɛibu",
#   "part_of_speech": "Noun",
#   "wikidata_url": "https://www.wikidata.org/wiki/Lexeme:L1005",
#   "senses": [
#     {
#       "sense_wikidata_id": "S1",
#       "english_gloss": "To enter or entry",
#       "order": 0
#     }
#   ],
#   "forms": [
#     {
#       "dag_text": "Kpɛi",
#       "feature_labels": "Infinitive"
#     }
#   ]
# }
