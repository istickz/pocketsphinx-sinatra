# pocketsphinx-sinatra

Basic Transcription API built with Sinatra using CMU Pocketsphinx libraries.

# Dependencies

CMU Sphinx Libraries

* [Sphinxbase](https://github.com/cmusphinx/sphinxbase)
* [Pocketsphinx](https://github.com/cmusphinx/pocketsphinx)

# Setup

The `prepare` script was used on an AWS linux 64-bit box to configure the box
with necessary libraries. No guarantees that it works anywhere else.
Theoretically you can clone this repo and standup your own pocketsphinx
transcription server in a couple minutes using Elastic Beanstalk.

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

# TODO

* [ ] Error handling
* [ ] Streaming
