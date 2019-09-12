# SaySah

_A Media library builder for the Techsun Q3 Pocket Radio Recorder/Digital Audio Player._

## Background

In Sierra Leone I met a blind pastor named Sah.  I was impressed by his diligence in understanding well the matters he spoke about to his congregation, and I wanted to put tools in his hands to help him.

I went back to the States for a year, and during that time was looking for an digital audio player, particularly one which would be condusive for use by someone with a seeing disability.  Most MP3 players rely heavily on interaction with a touch screen, but the Techsun Q3 features a numeric pad for selecting tracks, and while the screen provides useful information, for the most part the device can be operated without looking at it, particularly if one is familiar with the numbering of all the media files in storage on the device.

The next problem was that the Q3 arranges its MP3 files in simple alphabetical order.  That might be fine for small collections of media, but the Q3 does not provide an interface for accessing folders, and so there is the potential that the media will not end up in the order we wish.  For instance, if we've included the gospel of Matthew in both the NIV and ESV Bibles, we may find that the first track (`0001`) may be `Matthew_01_ESV.mp3` immediately followed by `Matthew_01_NIV.mp3` (and not, as we might have expected, `Matthew_02_ESV.mp3`).

So _all_ media must be setup in a single folder, and should be named in such a way that the local sequences of particular resources will be respected.  This software is meant to provide consistent renaming of resources, including the prefixing of a four digit index to each file name.

## How To Use This Software

### Setup environment

First, create an environment file:

```
$ cp .env.example .env
```

And then choose the appropriate values for the variables set in that file:

- `MEDIA_STAGING_PATH` - this is the staging location where the library will be built.  Symbolic links to each included `.mp3` file will be put here, for eventual installation to an SD memory card (which can then be put into your Q3 for use).
- `SD_MEDIA_PATH` - path to the SD memory card onto which you wish to install the media library.

### Setup library index

Next, we need an map to all resources to be included in the Q3's library.  We can start with the included example:

```
$ cp index.example.yaml index.yaml
```

Then replace the values in the example resource, and add any additional resources as needed:

```yaml
---
- name: ESV_Bible
  path: /path/to/raw/niv/mp3/files
  renamer: FaithComesByHearingRenamer
- name: KJV_Bible
  path: /path/to/raw/kjv/mp3/files
  renamer: FaithComesByHearingRenamer
```

Currently there are four renamer classes included with this software:

- `BaseRenamer` - All other renamers inherit from this, but it is usable in its own right; it will simply prepend the appropriate index onto the mp3 file name.
- `FaithComesByHearingRenamer` - For resources from https://faithcomesbyhearing.com.  This website includes audio translations of the Bible into a lot of languages.  In our case, the New Testament in the Kono langauge was of particular interest to our Pastor Sah, since Kono is his mother tongue.
- `AudibleRenamer` - A general-purpose renamer for audio books from [Audible.com][audible]. 
- `AudibleNIVRenamer` - A renamer for the David Suchet reading of the NIV Bible on [Audible.com][audible]

[audible]:https://audible.com

Additional renamer classes can be added as needed, and of course pull requests with new renamers are welcome.

### Running the software

Once everything is setup, there are four commands, all accessible via rake (see `rake -T`):

- `reset` - removes all symbolic links from the staging directory
- `build` - creates symbolic links to all included media (first runs `reset`)
- `install` - copies all media linked in the staging directory onto the SD memory card
- `generate_toc` - generates a 3-column table of contents of all symbolic links in the
staging directory to standard out.

Note that after running `build`, the staging directory will contain symbolic links to all of the media included in the desired library.  Each of those links will have the renamed file name, including the four digit index, which orders the files correctly, and also, happily, corresponds to the number you should enter on your Q3 when you wish to play that track.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joelhelbling/saysah. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct][code_of_conduct].

## License

This software is available as open source under the terms of the [MIT License][mit].

## Dedication

This software is dedicated to my Sierra Leonean pastor, Pastor Sah.

[code_of_conduct]: https://github.com/joelhelbling/saysah/blob/master/CODE_OF_CONDUCT.md
[mit]: https://opensource.org/licenses/MIT