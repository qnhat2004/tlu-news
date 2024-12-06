<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-header">
                    <h3 class="mb-0">
                        <?php echo $new->getTitle(); ?>
                    </h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="<?php echo $new->getImage(); ?>" class="img-fluid rounded mb-4" alt="<?php echo $new->getTitle(); ?>">
                        </div>
                        <div class="col-md-8">
                            <p><?php echo $new->getContent(); ?></p>
                        </div>
                    </div>
                    <div class="text-muted text-right">
                        Đăng ngày: <?php echo $new->getCreatedAt(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
