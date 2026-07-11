class Category:
    def __init__(self, id, name, parent_id=None):
        self.id = id
        self.name = name
        self.parent_id = parent_id
    def __repr__(self): return self.name

state = [Category(1, 'Fruit'), Category(2, 'Veg', 1), Category(3, 'Dairy'), Category(4, 'Vegan', 1),  Category(5, 'Dairy grass-fed'),]

# def setCategoryReorder(listOfID):
def setCategoryReorder(newIndex, oldIndex):

    reordered = [c for c in state if c.parent_id is None]

    print(reordered)
    print([c.id for c in reordered])
    print("-----------------------")

    # if oldIndex < newIndex:
    #     newIndex -= 1

    moved = reordered.pop(oldIndex)
    reordered.insert(newIndex, moved)
    print("-----------------------")
    print([c.id for c in reordered])
    print(reordered)


setCategoryReorder(0,1)
