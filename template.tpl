___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_tk_visible_ai_referral_classifier",
  "version": 1,
  "displayName": "Visible AI Referral / UTM Classifier",
  "categories": [
    "ATTRIBUTION",
    "ANALYTICS",
    "UTILITY"
  ],
  "description": "Classifies identifiable AI-driven sessions using utm_source and referrer signals when those signals are available.",
  "containerContexts": [
    "WEB"
  ],
  "securityGroups": []
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "fallbackValue",
    "displayName": "Fallback Value",
    "simpleValueType": true,
    "defaultValue": "(none)",
    "help": "Returned when no supported AI source is detected."
  },
  {
    "type": "CHECKBOX",
    "name": "returnMatchedHost",
    "checkboxText": "Return matched host instead of normalized platform label",
    "simpleValueType": true,
    "help": "Enable this to return the detected host, such as chatgpt.com, instead of a normalized label such as chatgpt."
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "customAiHostMappings",
    "displayName": "Additional AI Host Mappings",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Host",
        "name": "host",
        "type": "TEXT",
        "isUnique": true,
        "valueHint": "example-ai.com",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "defaultValue": "",
        "displayName": "Label",
        "name": "label",
        "type": "TEXT",
        "valueHint": "example_ai",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      }
    ],
    "help": "Use this table to extend the built-in AI host list with your own host-to-label mappings."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const getReferrerUrl = require('getReferrerUrl');
const getQueryParameters = require('getQueryParameters');
const getType = require('getType');
const makeString = require('makeString');

const normalizeString = function(value) {
  if (getType(value) !== 'string') return '';
  return makeString(value).toLowerCase().trim();
};

const normalizeHost = function(value) {
  const normalized = normalizeString(value);
  if (!normalized) return '';
  return normalized.indexOf('www.') === 0 ? normalized.slice(4) : normalized;
};

const getBuiltInMatches = function() {
  return [
    { host: 'chatgpt.com', label: 'chatgpt' },
    { host: 'chat.openai.com', label: 'chatgpt' },
    { host: 'searchgpt.com', label: 'chatgpt' },
    { host: 'perplexity.ai', label: 'perplexity' },
    { host: 'claude.ai', label: 'claude' },
    { host: 'gemini.google.com', label: 'gemini' },
    { host: 'bard.google.com', label: 'gemini' },
    { host: 'copilot.microsoft.com', label: 'copilot' },
    { host: 'edgeservices.bing.com', label: 'copilot' },
    { host: 'copilot.azure.com', label: 'copilot' },
    { host: 'chat.deepseek.com', label: 'deepseek' },
    { host: 'deepseek.com', label: 'deepseek' },
    { host: 'grok.com', label: 'grok' },
    { host: 'meta.ai', label: 'meta_ai' },
    { host: 'poe.com', label: 'poe' },
    { host: 'kagi.com', label: 'kagi' },
    { host: 'you.com', label: 'you' },
    { host: 'chat.mistral.ai', label: 'mistral' },
    { host: 'mistral.ai', label: 'mistral' },
    { host: 'phind.com', label: 'phind' },
    { host: 'search.brave.com', label: 'brave_ai' },
    { host: 'pi.ai', label: 'pi' },
    { host: 'heypi.com', label: 'pi' },
    { host: 'huggingface.co', label: 'huggingchat' },
    { host: 'character.ai', label: 'character_ai' },
    { host: 'jasper.ai', label: 'jasper' },
    { host: 'copy.ai', label: 'copy_ai' },
    { host: 'app.copy.ai', label: 'copy_ai' },
    { host: 'writesonic.com', label: 'writesonic' },
    { host: 'app.writesonic.com', label: 'writesonic' },
    { host: 'quillbot.com', label: 'quillbot' },
    { host: 'blackbox.ai', label: 'blackbox' },
    { host: 'iask.ai', label: 'iask' },
    { host: 'waldo.fyi', label: 'waldo' },
    { host: 'exa.ai', label: 'exa' },
    { host: 'andisearch.com', label: 'andi' },
    { host: 'notion.so', label: 'notion_ai' },
    { host: 'notion.com', label: 'notion_ai' },
    { host: 'consensus.app', label: 'consensus' },
    { host: 'komo.ai', label: 'komo' },
    { host: 'notebooklm.google.com', label: 'notebooklm' },
    { host: 'duckduckgo.com', label: 'duckduckgo_ai' },
    { host: 'duck.ai', label: 'duckduckgo_ai' },
    { host: 'openai.com', label: 'openai' },
    { host: 'anthropic.com', label: 'anthropic' },
    { host: 'aitastic.app', label: 'aitastic' },
    { host: 'deepl.com', label: 'deepl' },
    { host: 'liner.ai', label: 'liner' },
    { host: 'wrtn.ai', label: 'wrtn' },
    { host: 'tavily.com', label: 'tavily' },
    { host: 'chat-gpt.org', label: 'chat_gpt_org' },
    { host: 'neeva.com', label: 'neeva' },
    { host: 'felo.ai', label: 'felo' },
    { host: 'coze.com', label: 'coze' },
    { host: 'venice.ai', label: 'venice' },
    { host: 'sider.ai', label: 'sider' },
    { host: 'openrouter.ai', label: 'openrouter' },
    { host: 'lmarena.ai', label: 'lm_arena' },
    { host: 'chat.qwen.ai', label: 'qwen' },
    { host: 'qwenlm.ai', label: 'qwen' },
    { host: 'my-ai.snapchat.com', label: 'snapchat_my_ai' },
    { host: 'reka.ai', label: 'reka' },
    { host: 'cohere.ai', label: 'cohere' },
    { host: 'forefront.ai', label: 'forefront' },
    { host: 'ai21.com', label: 'ai21' }
  ];
};

const getCustomMatches = function(table) {
  if (getType(table) !== 'array') return [];
  const rows = [];
  for (let i = 0; i < table.length; i++) {
    const row = table[i];
    const host = normalizeHost(row.host);
    const label = normalizeString(row.label);
    if (host && label) {
      rows.push({ host: host, label: label });
    }
  }
  return rows;
};

const matchSource = function(value, mappings) {
  const normalized = normalizeHost(value);
  if (!normalized) return null;

  for (let i = 0; i < mappings.length; i++) {
    const mapping = mappings[i];
    if (
      normalized === mapping.host ||
      normalized.indexOf(mapping.host) !== -1 ||
      mapping.host.indexOf(normalized) !== -1
    ) {
      return mapping;
    }
  }

  return null;
};

const fallbackValue = normalizeString(data.fallbackValue) || '(none)';
const mappings = getBuiltInMatches().concat(getCustomMatches(data.customAiHostMappings));

const utmSource = getQueryParameters('utm_source');
const utmMatch = matchSource(utmSource, mappings);
if (utmMatch) {
  return data.returnMatchedHost ? utmMatch.host : utmMatch.label;
}

const referrerHost = getReferrerUrl('host');
const referrerMatch = matchSource(referrerHost, mappings);
if (referrerMatch) {
  return data.returnMatchedHost ? referrerMatch.host : referrerMatch.label;
}

return fallbackValue;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "get_referrer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Community-ready template for classifying visible AI referral and UTM signals.
