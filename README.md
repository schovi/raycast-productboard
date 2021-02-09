# Raycast Productboard scripts

## Dependencies

- `jq` - library for working with json

   ```bash
   brew install jq
   ```

## Setting up API token

1. In your home directory create (or just update) `secrets.sh` file
   - or copy the example `cp -i ./secrets.sh.example ~/secrets.sh` (if file already exists it shows prompt to prevent accidental file override)
2. Open [Notes API for Insights](https://support.productboard.com/hc/en-us/articles/360058176853#h_01EY1CCSSXSC2WNSJWAYCZVC08)
   - and under **Get started** you can see how to get the public API token
3. Write the token into `secrets.sh`
   - `export PRODUCTBOARD_TOKEN="the token"`

TODO: find more native/convinient way or wait once the Raycast [will support it out of box](https://github.com/raycast/script-commands/issues/77)

## Scripts

### Create note

Arguments:

1. `title` - title of the note
2. `content` - the content of the note. Can be formatted with TODO
3. `customer_email` *[optional]* - email of who reported this note

#### On successfull reqest

The browser with the Note detail page will open

#### On error request

The error will be printed to the raycast window
