# Description

Helps enter key-strokes into a VirtualBox VMs programmatically from the host.
It is a [filter](http://en.wikipedia.org/wiki/Filter_%28Unix%29) - handle input from pipe or file.

Works in both python 2.6+ and python 3.

Note: The project was originally developed in [vbkick](https://github.com/wilas/vbkick).

# Usage

Example:
```
$ VBoxManage controlvm VM_NAME keyboardputscancode $(printf "Hello VM" | keys2vb.py)
$ VBoxManage controlvm VM_NAME keyboardputscancode $(printf "<Multiply(Hello, 3)> VM" | keys2vb.py)
```

Example keyboard scancodes:
```
$ printf "Hello VM" | keys2vb.py
2a 23 a3 aa 12 92 26 a6 26 a6 18 98 39 b9 2a 2f af aa 2a 32 b2 aa

$ printf "<Multiply(H,3)>" | keys2vb.py
2a 23 a3 aa 2a 23 a3 aa 2a 23 a3 aa

$ printf "<Multiply(<Wait>,3)>" | keys2vb.py
wait wait wait
```

Special keys:

`<Wait>` -  helps control time flow -  can not be use directly with VBoxManage

```
$ VBoxManage controlvm VM_NAME keyboardputscancode $(printf "Hello <Wait> VM" | keys2vb.py)
VBoxManage: error: Error: 'wait' is not a hex byte!
```

`<Multiply(what, N)>` - repeat "what" N times
