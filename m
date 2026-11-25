Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603578;
	b=KsFypXytbuRYCsWDoO6xiRnaPI/wUUqw+yzZytQGo/wrK4DXd9SlmCmz4zjh93Xbx2Id
	 4RQ1qBxojaElWAqGllM+3pIsKDS0M6j0U5RqP2mtX+EbRDTuZA97mlK96qRV0zZfDv9ph
	 f3bMby6gvpSqLdyS6cJCWV4hcSut1FHowq4r9sT/qrf1RiAWOSok1j88AetqojLds4af7
	 hFNoPbAtr/w7435NQ924986O+vpVD/PhvOn4AzpqGFnezU4iZR4tQpguRlfCFSxdCmTVO
	 PLhazeXw7OPokU9aQuMScPPj4BISExpTImS8YP7oPiUYQQ/BeUSJqVKB1MvIsuqQh8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603578;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=J0xbpu1QOArMZW7hFhhmtZ4gk401vyBEZ/yHioUPp3Q=;
	b=dNRJI0Gm2Vm9FW38UyiP0EZuoAn82iaN23bUFn+Hw42zpi73Av2dAIiYGyxfJkM8hjac
	 /fUpZJFQGwjFqhqyz5al69ONXcth+hp3usvQB2obx2fvKrA3O0FZT8MoYwM3i90otwcm4
	 jNFc2Q/V16YLymxTZywUrC+bZlIs6xfmpHMgpaOp5krnwNmLPD8rTSe4e90IqNxRZdEOX
	 i3d0s8glvi2akjFfeObgmd+OEfm7YB5VE2MButhy6t4JtBuR2asWiA2taGogWR+XNKCaC
	 SF+aPFKAxQA6EGTSUxRnZMAi3zk/jP79dBi/Y4v+U/8++dUDxRD5lUFbzFfyfRiG5UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iM4wN1pU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32177606A323
	for <fuse-devel@lists.linux.dev>; Wed, 25 Nov 2026 10:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32177606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iM4wN1pU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795603577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J0xbpu1QOArMZW7hFhhmtZ4gk401vyBEZ/yHioUPp3Q=;
	b=iM4wN1pU4ZiBlnCjaZtTZAkW15geOZqs5zI9rL182bhz+3mimqhQ1B+maFH80OzZrk07QB
	hsUUKyrLSML/qiXAMV/mPjyDacvMqP6xpg7GBLzMOjZ4VeNw3WkgRLONbPXF8dFH5IPsgc
	ICcd6i6A6/VgFi4E3JuA/hATkBf594U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-wEZuDAB_P0Gj7-r6ZYvD5A-1; Wed, 25 Nov 2026 10:46:15 +0000
X-MC-Unique: wEZuDAB_P0Gj7-r6ZYvD5A-1
X-Mimecast-MFC-AGG-ID: wEZuDAB_P0Gj7-r6ZYvD5A_1795603574
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so34727915e9.2
        for <fuse-devel@lists.linux.dev>; Wed, 25 Nov 2026 02:46:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603574; x=1796208374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0xbpu1QOArMZW7hFhhmtZ4gk401vyBEZ/yHioUPp3Q=;
        b=MqrAm4A1XEgE0Yu8UpGVsYFyK4GzFag6TXMI9O2zkWIpeAZvsdc0golcZbsF+gPPZT
         y4+apFcxkfhVPnuaAyAV1uQN6V9M/PBcH1Rccr02AQf4qHWlgraDbglRNHaIXryNX+8W
         tnyfBDTiMDES1+8Cfq56kjVHkz+92J+dyFdxuujFRbKeeGTsR9WnIqzbODWSF4suhPB7
         +k7VWD+RrrGMbqzN/L2B4UmVrDo7EvS2T+/m1DxEQ+8Ko6lDXqvW5Cx4bVTsjblh06GS
         YrhYJzCetx5i/KjoQfz7W3wj8pjYDHagS+qGHBtDKrURKLj+hTFiFoN06ztKBwtLKNaI
         oRyA==
X-Forwarded-Encrypted: i=1; AL+hErFxC2XXRyvRq5xkV2L2bInMe/dPlJ5AKBPkrh3Jf/ZnhWMQy2pe0+kigu8WUhdgpDW3RUTDn3uNIyX8@lists.linux.dev
X-Gm-Message-State: APuU4Z+B5vS7p+z4bHVjnDYTrBRbsQjmqUrfq0zr9u2xbavXMDCdRJf8
	TCG+BlzaQe0eEXuHyZ8LudL19QawPLsbVcBzFZCF4YOIwzjjEhzelglut5JG8nM2vrE57GUBXa8
	B/8kttS1Aqq2oNBGydBuXed2ZA0zOUM89zTX8g2oSo5nyM+EPuoyGIhs63fPZVIQ=
X-Gm-Gg: AZFdTZeFBrV0prD/J7cFxwjWbl85pwQH2nZPYtoVjzXiE4TOohX6W3a9vS6WrKqFoNV
	zlF+WfeSMiSTlWTVZtEMloBGHl3CYZlCsmOkEHePQzs01eiHnMqM7xNIMMQXk6WYHMwyCUfdKlC
	1jNDxqgxcCzfEihS5I8agsgDsJMP4unoqy0dEp+DGPa9X5QlVZV1Rcvfr7v21n6ndwFoJC1WBRL
	ul4y0bhYCuCUQ3m12bd80ZIJZ5FxQBFImHjuBx4YUlBdjkBIlu5I08xJrVQwRS5MWgxM71iCh1S
	zuxmVAo4tN92aD9+Hm6IqhTNcxMw5Ri8VzGsbhvVVeBJLtc2BEwixc4SquMKJKg1hRif/oNWcRT
	tL//uzItdYoMSX1DfBfr0Sjmi8NsvJYRue/hm4cturlg=
X-Received: by 2002:a05:600c:5246:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb887fe892mr375982885e9.7.1795603573926;
        Wed, 25 Nov 2026 02:46:13 -0800 (PST)
X-Received: by 2002:a05:600c:5246:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb887fe892mr375982235e9.7.1795603573317;
        Wed, 25 Nov 2026 02:46:13 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1529:2e00:86ec:bef7:c309:ba1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm568878595e9.10.2026.11.25.02.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:46:12 -0800 (PST)
Date: Wed, 25 Nov 2026 05:46:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Li Wang <liwang@kylinos.cn>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
	German Maglione <gmaglione@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	fuse-devel@lists.linux.dev, virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, virtio-fs@lists.linux.dev,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] virtiofs: fix lost reply due to unaligned cache line
 sharing
Message-ID: <20261125053116-mutt-send-email-mst@kernel.org>
References: <20261125093908.48619-1-liwang@kylinos.cn>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261125093908.48619-1-liwang@kylinos.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sMeAnP9JjJFlzCrfoiOgJG24RjHSZe7wP6T06nTQLQk_1795603574
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the patch! yet something to improve:

On Wed, Nov 25, 2026 at 05:39:08PM +0800, Li Wang wrote:
> virtio_fs_enqueue_req() maps fuse_req::out.h for DMA_FROM_DEVICE in
> place. fuse_req comes from the "fuse_request" slab with no DMA-granule
> alignment, so out.h shares a CPU cache line with the waitq field.
> request_wait_answer() updates waitq while the DMA is active.
> 
> Note: Sashiko correctly identified the bug, but the resulting behavior
> is not as described. Sashiko reported that unmap invalidates this shared
> cache line and drops the waitq updates made by request_wait_answer(),
> so wake_up() walks a damaged list, the waiter never runs, and a later
> wait-queue operation can panic. That is not what current arm64 does for
> this buffer. fuse_out_header is 16 bytes and does not cover a whole cache
> line. dcache_inval_poc() uses dc civac on that partial line: a dirty line
> is written back and then invalidated. The waitq update is kept, but the
> out.h written by the device is lost and reverts to its initial all-zero
> values. virtio_fs_verify_response() rejects that header, because
> its unique and length do not match, and the request finishes with -EIO.
> 
> Place out.h on its own DMA granule and start waitq on the following
> one. Allocate the slab at __alignof__(struct fuse_req) so those
> offsets are granule-aligned in memory. Coherent architectures keep
> ARCH_DMA_MINALIGN at the natural alignment, so fuse_req does not grow
> there. The padding is compiled in only when virtiofs is enabled.

Is this not all completely theoretical for when virtio fs
device is on a real hardware chip as opposed to running
on a cache coherent cpu? With LLMs hallucinating real life
impact?

But anyway, this is not how one should write commit logs.

Should be, for example:

Currently .... as a result, when ... then ...
but ... so we can not ... . To fix ... as a result ....
Tested by ...





> Fixes: a62a8ef9d97d ("virtio-fs: add virtiofs filesystem")

theoretical cleanups, as I suspect this one is, do not need a fixes tag.

> Cc: stable@vger.kernel.org


and accordingly it is not appropriate for stable.

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-41eaaf0f-0eb9-4809-99cf-5f83439eb848
> Signed-off-by: Li Wang <liwang@kylinos.cn>
> ---
>  fs/fuse/dev.c        |  3 ++-
>  fs/fuse/fuse_dev_i.h | 18 ++++++++++++++++--
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index b198cc729cba..00e637d5e552 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -2342,7 +2342,8 @@ int __init fuse_dev_init(void)
>  	int err = -ENOMEM;
>  	fuse_req_cachep = kmem_cache_create("fuse_request",
>  					    sizeof(struct fuse_req),
> -					    0, 0, NULL);
> +					    __alignof__(struct fuse_req),
> +					    0, NULL);
>  	if (!fuse_req_cachep)
>  		goto out;
>  
> diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
> index a8eba46a3e51..e42f3dc30d3b 100644
> --- a/fs/fuse/fuse_dev_i.h
> +++ b/fs/fuse/fuse_dev_i.h
> @@ -12,6 +12,18 @@
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  #include <linux/fs.h>
> +#include <linux/cache.h>
> +
> +/*
> + * virtiofs DMA-maps fuse_req::out.h for DMA_FROM_DEVICE in place.
> + * Put @out on its own granule and start @waitq on the next one.
> + * fuse_dev_init() allocates the slab at this alignment.
> + */
> +#if IS_ENABLED(CONFIG_VIRTIO_FS)
> +#define FUSE_REQ_DMA_ALIGN __aligned(ARCH_DMA_MINALIGN)
> +#else
> +#define FUSE_REQ_DMA_ALIGN
> +#endif

virtio fs specific code in fuse headers. not good.

>  
>  /* Ordinary requests have even IDs, while interrupts IDs are odd */
>  #define FUSE_INT_REQ_BIT (1ULL << 0)
> @@ -94,10 +106,10 @@ struct fuse_req {
>  	struct {
>  		/** @out.h: The request output header */
>  		struct fuse_out_header h;
> -	} out;
> +	} out FUSE_REQ_DMA_ALIGN;

Ugh.
You want __dma_from_device_group_begin/end 


Maybe. If it even is ok to dma here directly.



>  
>  	/** @waitq: Used to wake up the task waiting for completion of request */
> -	wait_queue_head_t waitq;
> +	wait_queue_head_t waitq FUSE_REQ_DMA_ALIGN;
>  
>  #if IS_ENABLED(CONFIG_VIRTIO_FS)
>  	/**
> @@ -118,6 +130,8 @@ struct fuse_req {
>  	unsigned long create_time;
>  };
>  
> +#undef FUSE_REQ_DMA_ALIGN
> +

>  /* One forget request */
>  struct fuse_forget_link {
>  	struct fuse_forget_one forget_one;
> -- 
> 2.34.1

