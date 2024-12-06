<div class="container">
    <h1 class="mb-4">Tin Tức Mới Nhất</h1>
    <div class="row">
        <?php foreach($news as $item) : ?>
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="<?php echo $item->getImage(); ?>" class="card-img-top" alt="<?php echo $item->getTitle(); ?>" style="height: 250px; object-fit: cover;">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title" style="font-size: large;"><?php echo $item->getTitle(); ?></h5>
                        <p class="card-text flex-grow-1"><?php echo mb_strimwidth($item->getContent(), 0, 100, '...'); ?></p>
                        <p class="card-text mt-2"><strong>Thể loại:</strong> <span class="badge bg-warning">
                            <?php foreach($categories as $category) {
                                if ($category->getId() === $item->getId()) {
                                    echo $category->getName();
                                    break;
                                }
                            } ?>
                        </span></p>
                        <a href="index.php?controller=news&action=detail&id=<?php echo $item->getId(); ?>" class="btn btn-primary mt-auto">Xem chi tiết</a>
                    </div>
                    <div class="card-footer text-muted">
                        Đăng ngày: <?php echo $item->getCreatedAt(); ?>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>
