#!/usr/bin/env bash

gconftool-2 --dump /schemas/apps/guake > schemas.xml
gconftool-2 --dump /apps/guake > apps.xml
