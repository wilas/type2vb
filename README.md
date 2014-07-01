# Description

Helps enter key-strokes into a VirtualBox VMs programmatically from the host.
It is a [filter](http://en.wikipedia.org/wiki/Filter_%28Unix%29) - handle input from pipe or file.

Works in both python 2.6+ and python 3.

Note: The project was originally developed in [vbkick](https://github.com/wilas/vbkick).

# Usage

Example:
```
$ VBoxManage controlvm VM_NAME keyboardputscancode $(echo "Hello VM" | type2vb.py)
$ VBoxManage controlvm VM_NAME keyboardputscancode $(echo "<Multiply(Hello, 3)> VM" | type2vb.py)
```

Example keyboard scancodes:
```
$ echo "Hello VM" | type2vb.py
2a 23 a3 aa 12 92 26 a6 26 a6 18 98 39 b9 2a 2f af aa 2a 32 b2 aa

$ echo "<Multiply(H,3)>" | type2vb.py
2a 23 a3 aa 2a 23 a3 aa 2a 23 a3 aa

$ echo "<Multiply(<Wait>,3)>" | type2vb.py
wait wait wait
```

Special keys:

`<Wait>` -  helps control time flow -  can not be use directly with VBoxManage

```
$ VBoxManage controlvm VM_NAME keyboardputscancode $(echo "Hello <Wait> VM" | type2vb.py)
VBoxManage: error: Error: 'wait' is not a hex byte!
```

`<Multiply(what, N)>` - repeat "what" N times
