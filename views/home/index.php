<div class="container mt-5">
    <h1>Danh sách tin tức</h1>
    <div class="row">
        <?php foreach ($news as $item): ?>
            <div class="col-md-4">
                <div class="card">
                    <img src="<?= $item->getImage()?>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><?= $item->getTitle()?></h5>
                        <a href="index.php?controller=news&action=detail&id=<?= $item->getId()?>" class="btn btn-primary">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>