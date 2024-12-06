<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-info">
                    <h4>Edit Article</h4>
                </div>

                <div class="card-body">
                    <form action="index.php?controller=admin&action=update" method="PUT" enctype="multipart/form-data">
                        <div class="form-group mb-3">
                            <label for="title" class="form-label">Title</label>
                            <input type="text" id="title" class="form-control" value="<?php echo $article->getTitle(); ?>">
                        </div>
                        <div class="form-group mb-3">
                            <label for="content" class="form-label">Content</label>
                            <textarea name="content" id="content" class="form-control" rows="5"><?php echo $article->getTitle(); ?></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label for="category" class="form-label">Category</label>
                            <select id="category" class="form-control">
                                <option value="<?php echo $article->getCategoryId(); ?>"><?php echo $category; ?></option>
                                <?php foreach($categories as $category): ?>
                                    <option value="<?php echo $category->getId(); ?>"><?php echo $category->getName(); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="image" class="form-label">Image URL</label>
                            <input type="text" id="image" name="image" class="form-control" value="<?php echo $article->getImage(); ?>">
                        </div>
                        <div class="form-group mb-3"></div>
                            <button type="submit" class="btn btn-success">Update Article</button>
                            <a href="index.php?controller=admin" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>