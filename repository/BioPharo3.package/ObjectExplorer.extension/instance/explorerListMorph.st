*BioPharo3
explorerListMorph

	^ SimpleHierarchicalListMorph 
			on: self
			list: #getList
			selected: #getCurrentSelection
			changeSelected: #noteNewSelection:
			menu: #genericMenu:
			keystroke: #explorerKey:from: