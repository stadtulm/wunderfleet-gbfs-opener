Wunder Fleet GBFS Opener
========================

In the City of Ulm we have scooter sharing providers based on the Wunder Fleet provider software. They provide, combined with their MDS interface, GBFS data - but sadly only with authentication.

The [MDS standard](https://github.com/openmobilityfoundation/mobility-data-specification/blob/1.0.0/provider/README.md#gbfs) *requires* that GBFS data has to be publicly available. Until Wunder updates their interface to be fully compatible with MDS, we're using this tool to provide the GBFS data ourselves.

This docker container is basically nothing more than a simple nginx proxy, that authenticates against the GBFS URL. It also rewrites the URLs contained inside, so it is usable by tools which enter by accessing `gbfs.json` and use the URLs to find the free_bike_status and system_information data.


Usage
-----

The container needs two environment variables to run: `WUNDER_BACKEND_HOST` and `WUNDER_API_TOKEN`.

Ask your sharing provider to get these two. Note that the `WUNDER_API_TOKEN` is the City Access Token for their _Mobility Data API_. It may be that your sharing provider has to call their wunder support representative to create these for you.

If you mount the container with something like the kubernetes ingress, the container also provides you with support for the `X-Forwarded-Proto`, `X-Forwarded-Host`, `X-Forwarded-Port` and `X-Forwarded-Path` headers, so the URLs that are rewritten in the json contain the right parts needed to work.