Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9212B3F0AA2
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 19:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776885506; cv=pass; b=Vj2HBWjCcW20NlY4nxsJRZs/TWMy/FeVGZ+f/t4jdO0ERBkGkHd9TjRBk5z6UEOzarH0arcd4G5MRJCAbCChaj+pA9M8MwC8JDeB6xW4Gns1HWrpMmdTA2y8ZX3Iy370K1ZrlSjFQRsLXjb3MgUNrJVnAmE7r/ZdNZnj5/1hD/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776885506; c=relaxed/simple;
	bh=eLTy6oaaj50lZLpuUrUrH8HqYBykJM1lQsw4SpqXqOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3T48bzIIKaqDwgfXCoN2ieyDHvUK9hVGIwD3MTjIKtTB3yVYEqon/BhgQQC0btKLCCJ5XiNUC84FNibB3y4UxXmYMh7tQXHuSC5k0P+Wy8uOGN7X2XCGjljLottpwkiyHO5aA1w6xgvHwRvAEXT/3ZLdJQOA6URNEpHnmFsaVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhQGjj0B; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhQGjj0B"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso5145376f8f.0
        for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 12:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776885497; cv=none;
        d=google.com; s=arc-20240605;
        b=QRYIw65vo0tvarZEe0O85nONFjH18SvLc82xEf9kA/Cnynv+NMfZFCehPp5lR9VU4T
         pPwVvQVvVfAgKm4n9BVz4QKL7HOTgPRIyxofPaGzPV5Ddbv9x4qZX5dBskobhibSzH7M
         T4RW2e635BUSAxYZ4HW7i5IpTCNQzQAn/GK9L7x5J5b6LrxUDUtytsiXa2JWFS+WiO10
         9S1SkAJopTuCaOlAgwyZ5PxquMbsGW1rrKgxt0uZCSyB+Di9uN515nrhIzRC1WrmabL0
         bE7Qu879g+zS84ApmySUlDffuPvqT6nY91m7/lumj7DbyPfzpRs2SA6ERcG9vwFoInz/
         qEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KL1J7XDwa+fXiRxbzmsV9G9cuoOI0uGFuRHKY3kS6Ys=;
        fh=fPSvN86XGCQTRZf82cRKmd1fKxjkAdLTJaGUCSJpNGA=;
        b=FbAaDQValS8lpFaCHu5P1OcHHkR2ItIvxu2NOGWpsACFXrO8q3MqW8hIvB9a6Ff4B2
         FVKfkhMMG5O7XBoLZ6rVdeVShNn/lY7KiXgWuC/dk8By1CzXxKDXhMZ0C8rV/ONy4dQp
         2AnHjraMb+HhlzS6WnMfLhNroR3XdzUZ+7o+OUJJydkFEh4Y26J3xzJDX/2O8tHrgek3
         wUKiguvsVJGcNyKcteuz9iDHSiBLB5NDLJFN9F4tR8na3i3q6Tes7sz+ACcwhUDisTG1
         JS8reOUZcracOm+/bUD/qveWQI26T3bKit8A0LvlOg+AFcwQEDj9xFU74zUP2tlXICoH
         b/ww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776885497; x=1777490297; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KL1J7XDwa+fXiRxbzmsV9G9cuoOI0uGFuRHKY3kS6Ys=;
        b=XhQGjj0BueBC1oSLVwoztWfIpFwrZysFagMPq23RjD1ghTrviHyMw9pflPsYXYdc7d
         Fsi378+St8t313r+mUxCDD7SXrMnN2/PxCBFqPnlWl73YaCOH5ZiaVudj6KMIcrj64Yd
         DKf4u7O48RLH9CI4p/cYtiWHVjwt65MBUqz8qq/77py+OCUUun+whrywHboYgFfyYXlc
         NwZDNshENtlIxfBjhGSBC7FWAiHdRgk7lCXqgpHyIRP0g4JvJ83BA7uBAc8dq2arzLdu
         tVJoC1xkqaOtXBwBKocM+LnHg6VXwxtk3+QP0AVHAzL75jKAP20mD7tdxJe57EBfqMfN
         zLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776885497; x=1777490297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KL1J7XDwa+fXiRxbzmsV9G9cuoOI0uGFuRHKY3kS6Ys=;
        b=Dq8BHGhNAIdKlJMXIUR552FTS+abBqUwiOYc9C3aGGysf9+dLBIwGUifBSLDUn4Y3+
         Zc0yyMvdv0GD3P4sKauXx+ISg6CTURa5NjoQuC5R2BB0d+0XAHYKha+HFvxvbJlbaQM+
         p4SgunuhpI5PLJp6Zw6OSV+i1GqbYuvesoHTp8QXZYREWex+9gBkuly2AaU9NPZ60++P
         s3KqiAZZcGnqlOatvDlU83t1hgDpLR327jPfECVA59tqc3T1Icp5PSzz+4DpfL7CNRpR
         02yCBMBZn9hIUXZLc2j/jNn/T6Eto7tw3pA8+bBCFgjfXCIdcLxKoUKVK1IzQbjZT1qh
         DNtQ==
X-Forwarded-Encrypted: i=1; AFNElJ80QZidoylcZTk9SxTpEld/QYnLkPr4S+Fxb8Zcf2klyUXPu0JtToDj5xJ6czjpthLqtwctNueMPxbg@lists.linux.dev
X-Gm-Message-State: AOJu0YzqNlTkACTvtDfhao6DFiEh7Hi5XA47LhGSMvmKRpfxu11wvzyg
	medaidYQZUoSf5JmfwqjFH4i2WRS0RaPY2/8WdwWWOqDoAy5H5TcUnTUTx+CnNyJxCKwiMzTUZx
	NQTuKJf7dmPzGBsnNDbE+gyeSj2jtdI4=
X-Gm-Gg: AeBDieuI4UqQ1R2ojQthc9INCXCepzdT1k2VWhz7UQFNR5bz5M6pizf+zVDWelIdf9K
	ULu/k+FiaGTiyVxd/nSzmfT0DSGuD77agvZsPDtMDp9wz70t4peiGezEm+l25BKBPQQTVpQmUmi
	BzYt6djNOEjaL/XvQdwQA1Q7zOl1jNlFm2dHKEb4nBgp8muFyDnvU3Pj7JktbQ8OaPW83aAY7fm
	r4CT84XgS493ZKLNaWHYbeP4t1sF8XzmjeCDz27477OQZ5zE0k7m3S4SjnDS+HYYtx7SSCb0Irn
	MwawaDnnioVBicRK3bb9oDhElVlplR7xUw==
X-Received: by 2002:a05:6000:2c0c:b0:43f:e22e:e8da with SMTP id
 ffacd0b85a97d-43fe3dc5b0bmr36635519f8f.5.1776885496593; Wed, 22 Apr 2026
 12:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260422103603.4554-1-liwang@kylinos.cn>
In-Reply-To: <20260422103603.4554-1-liwang@kylinos.cn>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 22 Apr 2026 12:18:03 -0700
X-Gm-Features: AQROBzCaS-8QbjrPyc2l81Nj3dNveAR9eyl0wnJlAUBz2SfvlWkj0od-yQhU1ss
Message-ID: <CAJnrk1bfCM3kF83mA5z4iPcw+w1_MHbrF4X2K7kLNRagtPD=XQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: fix kernel NULL pointer dereference in fuse_uring_add_to_pq()
To: Li Wang <liwang@kylinos.cn>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 3:38=E2=80=AFAM Li Wang <liwang@kylinos.cn> wrote:
>
> A kernel NULL pointer dereference was triggered when testing the
> 'fuse over io_uring' feature with passthrough_ll. The call trace
> is as follows:
>   BUG: kernel NULL pointer dereference, address: 0000000000000878
>   RIP: 0010:fuse_uring_add_req_to_ring_ent+0x89/0xd0 [fuse]
>   Call Trace:
>   <TASK>
>   fuse_uring_queue_fuse_req+0x82/0x100 [fuse]
>   fuse_chan_send+0xe6/0x180 [fuse]
>   fuse_lookup_name+0x131/0x2b0 [fuse]
>   fuse_lookup+0x78/0x1a0 [fuse]
>   fuse_atomic_open+0xfc/0x140 [fuse]
>   atomic_open+0x4b/0xf0
>   path_openat+0x746/0x1080
>   do_file_open+0xc9/0x180
>
> fuse_uring_create_queue() must initialize struct fuse_pqueue before assig=
ning
> the per-hash processing table:
>
> - Call fuse_pqueue_init() before setting fpq.processing. fuse_pqueue_init=
()
>   clears fpq.processing; assigning the kcalloc'd bucket array must happen
>   afterwards.
>
> - After allocating the processing bucket array with kzalloc_objs(), initi=
alize
>   each list head with INIT_LIST_HEAD(), matching fuse_pqueue_alloc() in d=
ev.c.
>   Zeroed list_head values are not valid empty lists; list_move_tail() wou=
ld
>   dereference NULL prev/next.
>
> Signed-off-by: Li Wang <liwang@kylinos.cn>
> ---
>  fs/fuse/dev_uring.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index d6d75e024b35..b765c1ff5e2d 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -282,6 +282,8 @@ static struct fuse_ring_queue *fuse_uring_create_queu=
e(struct fuse_ring *ring,
>                 kfree(queue);
>                 return NULL;
>         }
> +       for (int i =3D 0; i < FUSE_PQ_HASH_SIZE; i++)
> +               INIT_LIST_HEAD(&pq[i]);
>
>         queue->qid =3D qid;
>         queue->ring =3D ring;
> @@ -295,8 +297,8 @@ static struct fuse_ring_queue *fuse_uring_create_queu=
e(struct fuse_ring *ring,
>         INIT_LIST_HEAD(&queue->fuse_req_bg_queue);
>         INIT_LIST_HEAD(&queue->ent_released);
>
> -       queue->fpq.processing =3D pq;
>         fuse_pqueue_init(&queue->fpq);
> +       queue->fpq.processing =3D pq;
>
>         spin_lock(&fch->lock);
>         if (ring->queues[qid]) {
> --
> 2.34.1
>

Thanks for testing/reporting this! This lgtm but afaict, the patches
in that patchset aren't finalized yet so imo it'd be cleaner if this
gets folded into the original patch [1] instead of being its own
separate commit.

I think using fuse_pqueue_alloc() ends up being a tad bit cleaner, eg

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 5abf447e9710..e467b23e6895 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -277,7 +277,7 @@ static struct fuse_ring_queue
*fuse_uring_create_queue(struct fuse_ring *ring,
        queue =3D kzalloc_obj(*queue, GFP_KERNEL_ACCOUNT);
        if (!queue)
                return NULL;
-       pq =3D kzalloc_objs(struct list_head, FUSE_PQ_HASH_SIZE);
+       pq =3D fuse_pqueue_alloc();
        if (!pq) {
                kfree(queue);
                return NULL;
@@ -295,8 +295,8 @@ static struct fuse_ring_queue
*fuse_uring_create_queue(struct fuse_ring *ring,
        INIT_LIST_HEAD(&queue->fuse_req_bg_queue);
        INIT_LIST_HEAD(&queue->ent_released);

-       queue->fpq.processing =3D pq;
        fuse_pqueue_init(&queue->fpq);
+       queue->fpq.processing =3D pq;

after exporting fuse_pqueue_alloc() into fuse_dev_i.h

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/20260416091658.462783-32-mszeredi@re=
dhat.com/
