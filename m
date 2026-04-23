Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DCC22F767
	for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928690; cv=pass; b=CoS8YP7eNXUDb130oYqFBTA+eLZqjZs/kMptVZphRLVczskuCFVEaAnRC3joaLX+4Qb3YQdDEx3U6v7HIlkYmE88chzcwp1GHLxV0ax4V9mHOylNy8F+7gc2IrZLRYfIO/1LOpcFu7FZKRUKtguHIF8Ku3uqmcA2HMfHScVmJ2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928690; c=relaxed/simple;
	bh=sEE7eSw23XjiAzdN3t1VFAmCqcf2A3WvMahcw8fmQn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNU9ibf6NawVe0MBDVv9+4X/0E8eLLvB8GJ/h8hB7Ik/2/Y+tRkJ54i/t3/C+Le83D3yI7aSAT0C48wPH9oWwx1jyIj/sNmy9mKTcv9hS0taOmAp1VAAfvCNLgTJ+/MDUXx7O2qWDJKVFMTKAK+ekE5F3xZsCJkilYhxsZTq0LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=COl6+K5s; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="COl6+K5s"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50d6b9bca48so7177201cf.2
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 00:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776928686; cv=none;
        d=google.com; s=arc-20240605;
        b=ZlJv3iJ7jqeLoGdiuscjZyasjHNtRjzKmSemSsuTXO7qs1pzcjAt30DKq0UM24TIZU
         2hpiImn0TiC9gcH1sISbpHIRLc79oV5d9zQCbQfZpb/+pJdtO9a//Ow93j76fHZU7Wvg
         BfAsvODTlS8T/Gz+yHqgh1z8DE2Oe7zDvHgqzwJ6RFCl0Lr0ub5QTLLIaWbPOrKKmur9
         2JVkxvXsYyfRQXqPnBL2a30vgyl5Zv5xo6gZVpn8frs7Q+sOHbKlO49SRouMyDeH6MKU
         Aph9BPJ/FSMvHi+ydx2evDdxnYooXDZcBZBUayV9PDHBPRYpJmN3IdtciAqL6Z/DotFm
         dwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FQRQpAThPG9+s7vptTTQvRJwqE8owpSF9Izk7AIcNjs=;
        fh=Ha8eYUrxpi2w7ynfOXsG+iZ4vKQjhs8eQs6z0M6B584=;
        b=T/qkqVr9KqQ2dLUsNvFHvp642piWgr4K7FeQIxCdGBq7L05/RgFPXC02w0VpkGfbDg
         rdjrYNuKs8sH+6KwpJXfZ3ZTKemf11A0gCt/rHNASZiqz3m0G12a6mpmlk+C6HG6ZHMi
         54N0PynNeQsG/OVwRrIzOd/OOr26jz8yiVuxfwlYm5quPaLJTpXFLV2RGQYwmsFw54yJ
         hgT25LGPdkXTWc3nfOKomjWqlB7JlRJDz/qijgPw08KHR9yzrHJhGi9Bb/27o2RzsneR
         3p+1Z+sJlFExYdAshNHHvoQxyn1un4CIuQeKeDFGc9gwE6OJx3ujhCu3akLD6x6WRWL4
         Q5eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1776928686; x=1777533486; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FQRQpAThPG9+s7vptTTQvRJwqE8owpSF9Izk7AIcNjs=;
        b=COl6+K5sytNCvVzRt9IMhsTKKrVn2psKaHto5HYhbdcpQNX+mqJOPkVYQQiV3zw0UV
         T2uoxgTfgwia3Bn8DMJurmHJirxyOFfFRx5HKYgC4a/fBYgPPQFRc6qn33TIf7R/PSdL
         TD/UcDwhHrqb2uEDF9OL2i/CSpK6EJgb5C3mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928686; x=1777533486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQRQpAThPG9+s7vptTTQvRJwqE8owpSF9Izk7AIcNjs=;
        b=TTVjHqia2bfbHTGFDFSVVPsT/gzSjDJ9WR01tlYbnKvYnkvSlLLSvAr8BjjfdqG33c
         HM1KtcrngHE1tslvJeihyuyTYl34ykamajVucx/+Hffj4i8bjI7q4n6nmZv5SJ0o5fXf
         d1HB04wtPtilsr7ff3/vRx5q8c+6jVB4MyOGvfzlA0E4I9hByjEetEwjZX9E8W1Gbem+
         tUajKnDkT4QH+KMXnLr9Fh3zQ2SyithCYcMAvALCZuWCAY+qmigUs1Ata64YgORZG0zn
         Qpa/OBPac3eV9zQ36biXri3KBKSFWK6fCJL7nkHDKS5TZtvuhJ8bTHhkmsNO/pfq8tsf
         T1pQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3Xz9JKFesZRO2JWywly8KZt3FLbhQ7njMvS1R1GlbQHlPcDZVeddVHYFmHedJOcOISVkzByNxLix3@lists.linux.dev
X-Gm-Message-State: AOJu0YwID9PnS5UR9fGauj/trRROrGR+vO0kcUuPlstr9pEHWAldZ+p0
	Fg4LWuSoel5DQrRVyun5ihnYNnk12UhtlpEcEzWgiDU+q7WIgfb1WLmsUuijzGVZFb9Xhs/kvVs
	yEYMjj0sUSKi3Q5Y1s/gc42be49CwOYtC871g/TX2es/GRE7j1KTO9Gs=
X-Gm-Gg: AeBDiev2cTSGbsu8ZkswE9Amj39Yxiv2MP/v2lpJgTtATIjZsnYJ2sQEH6e6Td5BkSX
	A5LCj0cJO/gfG1ZdNdeEWRJdGpbedVMl0TSi6moayTgacQBiLCfNlSH5OuDXpYuYNRVGs/59ppN
	zzvVrAQzwT6ItiL6n2bgzqKYuwK8kXQ3gCcPZYHGp49xCe6CFeqCNghXZQizltE7fvEmYvFJjzL
	+3i3RN3Ixk5BNMjgraCFxNJS3GnZP3vP+w0medThdUCoHgHkJnoDuceoPp8wx7Y54VW5d+y9A2Q
	R+WFAmtLa83MKNejSoMYm2sqj+yhS/YuWD2UEg7xlKP+BxvgpmjVtGhCKHGeEw==
X-Received: by 2002:ac8:7f16:0:b0:50d:7135:5631 with SMTP id
 d75a77b69052e-50e368281ecmr392606701cf.6.1776928685739; Thu, 23 Apr 2026
 00:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260422103603.4554-1-liwang@kylinos.cn> <CAJnrk1bfCM3kF83mA5z4iPcw+w1_MHbrF4X2K7kLNRagtPD=XQ@mail.gmail.com>
 <7f435631-931a-43a7-b1e5-e736c5527459@kylinos.cn>
In-Reply-To: <7f435631-931a-43a7-b1e5-e736c5527459@kylinos.cn>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 23 Apr 2026 09:17:53 +0200
X-Gm-Features: AQROBzCfkrtcCIFqsA-BrnWUVe-FN6BJUArJ48WXC_MZ9zreRuZYTFtDt1uCU8U
Message-ID: <CAJfpegsqMQ5TuXtPGxHAkbf9oRz571W+Ccyc_JO65KHHLJ7EJg@mail.gmail.com>
Subject: Re: [PATCH] fuse: fix kernel NULL pointer dereference in fuse_uring_add_to_pq()
To: Li Wang <liwang@kylinos.cn>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 08:45, Li Wang <liwang@kylinos.cn> wrote:

> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index 5abf447e9710..e467b23e6895 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -277,7 +277,7 @@ static struct fuse_ring_queue
> > *fuse_uring_create_queue(struct fuse_ring *ring,
> >         queue = kzalloc_obj(*queue, GFP_KERNEL_ACCOUNT);
> >         if (!queue)
> >                 return NULL;
> > -       pq = kzalloc_objs(struct list_head, FUSE_PQ_HASH_SIZE);
> > +       pq = fuse_pqueue_alloc();
> >         if (!pq) {
> >                 kfree(queue);
> >                 return NULL;
> > @@ -295,8 +295,8 @@ static struct fuse_ring_queue
> > *fuse_uring_create_queue(struct fuse_ring *ring,
> >         INIT_LIST_HEAD(&queue->fuse_req_bg_queue);
> >         INIT_LIST_HEAD(&queue->ent_released);
> >
> > -       queue->fpq.processing = pq;
> >         fuse_pqueue_init(&queue->fpq);
> > +       queue->fpq.processing = pq;
> >
> > after exporting fuse_pqueue_alloc() into fuse_dev_i.h

Folded.

Thanks,
Miklos
