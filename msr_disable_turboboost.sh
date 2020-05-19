#!/bin/sh

# // disables turbo boost, thermal control circuit
wrmsr -a 0x1a0 0x4000850081



