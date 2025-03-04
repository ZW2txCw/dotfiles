#!/usr/bin/env python3

import psutil
from psutil._common import bytes2human


def main():
    mem = psutil.virtual_memory()
    res = [
        "/proc/meminfo [ Used:%{F#bf616a} ",
        bytes2human(mem.used),
        " %{F-}][ Total:%{F#a3be8c} ",
        bytes2human(mem.total),
        " %{F-}][%{F#81a1c1} ",
        str(mem.percent),
        "% %{F-}]",
    ]

    print("".join(res))


if __name__ == "__main__":
    main()
