class TreeNode
{
    [object]$data
    [TreeNode]$left
    [TreeNode]$right

    TreeNode()
    {
        $this.data = $null
        $this.left = $null
        $this.right = $null
    }
}

class BinarySearchTree
{
    [TreeNode]$root
    [int]$nodeCount

    BinarySearchTree()
    {
        $this.nodeCount = 1
        $this.root = [TreeNode]::new()
        $this.root.data = 0
    }

    [int]GetNodeCount()
    {
        return $this.nodeCount
    }

    # private function
    hidden [void]InsertNodeImpl([TreeNode]$n, [object]$data)
    {
        # protect border
        if ($n -eq $null) {
            return
        }

        # same value already exits, return
        if ($n.data -eq $data) {
            return
        }

        if ($data -gt $n.data) {
            if ($n.right -eq $null) {
                $n.right = New-Object TreeNode
                $n.right.data = $data
                $this.nodeCount++
                return
            } else {
                $this.InsertNodeImpl($n.right, $data)
            }
        }

        if ($data -lt $n.data) {
            if ($n.left -eq $null) {
                $n.left = New-Object TreeNode
                $n.left.data = $data
                $this.nodeCount++
                return
            } else {
                $this.InsertNodeImpl($n.left, $data)
            }
        }
    }

    [void]InsertNode([object]$data)
    {
        $this.InsertNodeImpl($this.root, $data)
    }

    hidden [void]PreorderTraversalImpl([TreeNode]$n)
    {
        if ($n -eq $null) {
            return
        }
        Write-Host $n.data
        $this.PreorderTraversalImpl($n.left)
        $this.PreorderTraversalImpl($n.right)
    }

    [void]PreorderTraversal()
    {
        $this.PreorderTraversalImpl($this.root)
    }
}

$tree1 = New-Object BinarySearchTree
Write-Host $tree1.GetNodeCount()
$tree1.InsertNode(1)
$tree1.InsertNode(5)
$tree1.InsertNode(-1)
Write-Host $tree1.GetNodeCount()
$tree1.PreorderTraversal()