<div class="container">
    <div class="mt-3">
        <h2>Manage Articles</h2>
        <a href="index.php?controller=admin&action=add" class="btn btn-success mb-3">Add New Article</a>
    </div>

    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Content</th>
                <th>Image</th>
                <th>Category</th>
                <th>Published Time</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($news as $article): ?>
                <tr>
                    <td><?php echo $article->getId(); ?></td>
                    <td><?php echo $article->getTitle(); ?></td>
                    <td style="width: 50%;"><?php echo $article->getContent(); ?></td>
                    <td><img src="<?php echo $article->getImage(); ?>" alt="Article Image" style="max-width: 100px;"></td>
                    <td><?php 
                        foreach ($categories as $category) {
                            if ($category->getId() === $article->getId()) {
                                echo $category->getName();
                                break;
                            }
                        }
                    ?></td>
                    <td><?php echo $article->getCreatedAt(); ?></td>
                    <td>
                        <a href="index.php?controller=admin&action=edit&id=<?php echo $article->getId(); ?>" class="btn btn-primary btn-sm">Edit</a>
                        <form action="index.php?controller=admin&action=destroy&id=<?php echo $article->getId(); ?>" method="POST" class="d-inline">
                            <button type="submit" class="btn btn-danger btn-sm"
                                onclick="return confirm('Are you sure?')">Delete</button>
                        </form>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>