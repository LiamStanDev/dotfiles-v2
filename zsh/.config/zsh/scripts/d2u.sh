#!/bin/bash

fd -t f . | xargs -I {} dos2unix {}
