# pocketsphinx-sinatra

Basic Transcription API in sinatra using CMU pocketsphinx libraries.

# Dependencies

CMU Sphinx Libraries

* [Sphinxbase](https://github.com/cmusphinx/sphinxbase)
* [Pocketsphinx](https://github.com/cmusphinx/pocketsphinx)

# Transcribe

HTTP POST request to `/transcribe`

## Post data

```json
{
  "recording": "base_64_encoded_string",
  "file_type": "wav"
}

```

## Response data
```json
{
  "hypothesis": "hello world"
}
```
