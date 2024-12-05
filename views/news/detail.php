<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header"><h3>
<?php
    echo $new->getTitle();
?>

                </h3></div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-2">
                            <img src="<?php echo $new->getImage(); ?>" class="img-fluid mb-4" alt="<?php echo $new->getTitle(); ?>">
                        </div>
                        <div class="col-md-6">
                            <p><?php echo $new->getContent(); ?></p>
                        </div>
                        <div class="text-muted">
                            Đăng ngày: <?php echo $new->getCreatedAt(); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>