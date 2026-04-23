Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A051E3914F5
	for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 06:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776926677; cv=none; b=bmV1B9EdsHBJXXtC+5NIF1qnHG0xWmFTCQhnsSwsO8aegHB38yxtkAHtvLnTtzLQPuar6V0zHY5/LKt9Q0ttakifqzeQ/op136mqfRkOBE0yv2XeYHFj8XwIWmJrG9Ld0psgJ4or296j5qShDBmBcqIDM2mARXH5Vizw6kytPtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776926677; c=relaxed/simple;
	bh=a6QjDIcG+MNRslYuicUkt1Lo6d6Qm21OW4DL9DFKgo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vD+kdKmcZp60vhwwhJj2K8tgX+B7NyoOAyLH7qQ2m0BlayZuC4jWm7bEIuaXy8oZo2cI3dLD4B7OQLQ2Juk29mAzOnq9J3ili5+5TOSRL/8X5hWNo+k0ToTUd9dPHlabBZBnXibwa73nqTNlDM1n3u5klT5D4oiziNJf+ulNr30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ddba2c2a3edf11f1aa26b74ffac11d73-20260423
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:4b837fcc-50c0-4736-ab4c-5077a8193eb0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:565c0af75e520843594703ff107d84fe,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ddba2c2a3edf11f1aa26b74ffac11d73-20260423
X-User: liwang@kylinos.cn
Received: from [10.42.16.85] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liwang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 366083788; Thu, 23 Apr 2026 14:44:24 +0800
Message-ID: <7f435631-931a-43a7-b1e5-e736c5527459@kylinos.cn>
Date: Thu, 23 Apr 2026 14:44:21 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fuse: fix kernel NULL pointer dereference in
 fuse_uring_add_to_pq()
Content-Language: en-GB
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd@bsbernd.com>,
 fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260422103603.4554-1-liwang@kylinos.cn>
 <CAJnrk1bfCM3kF83mA5z4iPcw+w1_MHbrF4X2K7kLNRagtPD=XQ@mail.gmail.com>
From: Li Wang <liwang@kylinos.cn>
In-Reply-To: <CAJnrk1bfCM3kF83mA5z4iPcw+w1_MHbrF4X2K7kLNRagtPD=XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joanne,

On 23/04/2026 03:18, Joanne Koong wrote:

> 
> Thanks for testing/reporting this! This lgtm but afaict, the patches
> in that patchset aren't finalized yet so imo it'd be cleaner if this
> gets folded into the original patch [1] instead of being its own
> separate commit.
> 
> I think using fuse_pqueue_alloc() ends up being a tad bit cleaner
> 

Thanks for the feedback. I'm fine with either way (fold or split), 
and I will follow your suggestions and send out a v2.

Thanks,
Li

> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 5abf447e9710..e467b23e6895 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -277,7 +277,7 @@ static struct fuse_ring_queue
> *fuse_uring_create_queue(struct fuse_ring *ring,
>         queue = kzalloc_obj(*queue, GFP_KERNEL_ACCOUNT);
>         if (!queue)
>                 return NULL;
> -       pq = kzalloc_objs(struct list_head, FUSE_PQ_HASH_SIZE);
> +       pq = fuse_pqueue_alloc();
>         if (!pq) {
>                 kfree(queue);
>                 return NULL;
> @@ -295,8 +295,8 @@ static struct fuse_ring_queue
> *fuse_uring_create_queue(struct fuse_ring *ring,
>         INIT_LIST_HEAD(&queue->fuse_req_bg_queue);
>         INIT_LIST_HEAD(&queue->ent_released);
> 
> -       queue->fpq.processing = pq;
>         fuse_pqueue_init(&queue->fpq);
> +       queue->fpq.processing = pq;
> 
> after exporting fuse_pqueue_alloc() into fuse_dev_i.h
> 
> Thanks,
> Joanne
> 
> [1] https://lore.kernel.org/fuse-devel/20260416091658.462783-32-mszeredi@redhat.com/

