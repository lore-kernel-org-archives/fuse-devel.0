Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3652E7390
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 20:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786740918; cv=none; b=YueMZ79LRsu1v83cigi533qAD1AKGwG7Nfer55WXJlevR2z02DtUugR41j6wH+z6Zy/8iLjuIzQG1dZiEfnX7iRFK842it7Wv4HAFqJrpBN7PBERUCFbUrrH/yuCYbLlrMhdfQajx28eBa1LDXkv+C/Po8ogN52N4trs6kIdVgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786740918; c=relaxed/simple;
	bh=jCSg6jgoNJzdchzqljfp2KmwRAgxNXxrAMRKf2UL1Tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyEyKQ5VNYMWJWdplhio0rztCwroUopxrVLm3hRPWthMeqCtzVTrr645o91q45L0VPZiMtjX2G7ToieYktyPnnlh1aPZJcdNdLb/f1bZEROqy28vm4OHDYneUCqXJlj21b7VTlsCg86wdBZHCgF1tv7AxCtOI6Jo1m5IUOWilKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=eePMC6Lb; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="eePMC6Lb"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so2302178a91.0
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1786740916; x=1787345716; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmV/UF493i9FlrVuw4GTTOqFVnuYEkZb5dieGfPcvPU=;
        b=eePMC6Lbinfo/TFaeriXxvMUpBCPsN05x7IDU6WftsU6S1GWQH7oyjRpUKiIJ93TbY
         opRo7WblC8/P1+y1DjlSOIlxNrC2wK2UcfhTgjbnikZXox48p/BoqI8V4xvj0L7MeHob
         vk7n3XyvwN+Gdnlmt3ycLnXT7aRUXR3MaOK/5byzvDX7yTtE2LdDE+ISe7zg+sRs0EkK
         /oN9o+l+NSKKgjZ7/Gw8WK7/9zm61f7fTQ1EfAD3ITY2Qi1niuOidTw4Ffl7ZuExW/Op
         PpYW4X/trUgir9M/K/oeSbGgpdPkR/KFq23GT5S98s5Mp2T7w0DU9Z7oZapppQjM5Xri
         PbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786740916; x=1787345716;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmV/UF493i9FlrVuw4GTTOqFVnuYEkZb5dieGfPcvPU=;
        b=ax1tQTF54CGlBqxQ5EX41nn7ds1Yt32RyAvDMNcATg3UcQpu/mT1FAZN+qfLlNwEvp
         8KIPyzOqpTZiVUlSUp7R9FATrnOVHBllw3OucjrhFpYCpzl1QGxcaEdMRfn4R6msijWe
         z6GxNbLAJKaL7S1H6S6tUiLGqcUV3uUHIGLT7gdO2kpCOZN9RMvrjIB+/JDitXZ08WGl
         ZHICy9hi63VjLMsTm0xMNEUNN860zdKgSqNjN2jkvQZe3tXKDSoAZn8E6ZloT4cOjotI
         hb2qdJa8wBbQ85VtWfB+E4vgET1dR4jMUMb5Fw/lI6gJqNVShD7kKICpXZxHJB74ur8Y
         kahw==
X-Forwarded-Encrypted: i=1; AHgh+RqRAIDqOXTl6Ir3ZDEIEjUG7jQ9srg88P+bEBnI3bExnnaegY+3ZE7cOvw+/XdfeCVaih8loaDWL7Qv@lists.linux.dev
X-Gm-Message-State: AOJu0YwNXudiJWJhyF6aKrOQDWbGi48a/w1+yAkYFqcPU9lqzSXsx8YG
	jSTsuHKtmytu61CQzlVkTWGD/ixXMMWrw5D/FsIEa5aRiTxYYC7J/bGkVSMWSTmUlxQ=
X-Gm-Gg: AR+sD11NTeYJhP5K55k2w/BoahP69QzPLNGk0MfQl21hmBNbHKhwBNvvU3a7yCAuQS7
	lZA7KDDNlgJoxRWsnHqUt1JcezGHFs4Yv7+WltgIf1O7O8f8K1kGCSd9rRn48aSko5cmhJJ438A
	QPiFyTBdlAN1cKDZR2bq0P003Qv9wbFEHMyQlwCjp2lavdK2rVA9U0b2t6LtrxLk6hPrp4mILlK
	XUAC77G+ggmVpo/P+qNx80ZQD21chE0WxXHfzByuOkWgy8kp+fimGnfN3cQgafG+KDmZCEy1GP6
	w8K0n5OTTRoTqc88OL18ZA7nVnhISZFUYlTZDU9pbNPELn2GpC4Wdwmo3RdV8MPDDOxs5Rs7vxy
	OUwI35eThAnMNQR/wpGj2hEPgwhJT2AcJd80lpZ6Q09uxnh7S6T7Ati7t5Ash1YG7jFKByOTsxq
	KA9PKTb3TeU7XNYeqTUj0yk0B9We/M9Qrhtfxl47Z34OoxeiL3eE5FqPdkYcEUNRynj9l/9wpoZ
	KeNA7gNWHhF7Vp2lE3SJjn9z2Wp5YFpb83AtJLmEbeNQq9/rUsQATsw
X-Received: by 2002:a17:90b:3f50:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-3933b7213c9mr10111627a91.5.1786740916363;
        Fri, 14 Aug 2026 13:55:16 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::4:a11e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889d914sm12419069c88.13.2026.08.14.13.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 13:55:15 -0700 (PDT)
Message-ID: <65b910bc-67cf-49b6-b471-25280e7ba997@davidwei.uk>
Date: Fri, 14 Aug 2026 13:55:14 -0700
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
To: bernd@bsbernd.com, Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>,
 Gang He <dchg2000@gmail.com>, fuse-devel@lists.linux.dev,
 Bernd Schubert <bschubert@ddn.com>
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-28 15:55, Bernd Schubert via B4 Relay wrote:
> This adds bitmaps that track which queues are registered and which queues
> do not have queued requests.
> These bitmaps are then used to map from request core to queue
> and also allow load distribution. NUMA affinity is handled and
> fuse client/server protocol does not need changes, all is handled
> in fuse client internally.
> 
> Signed-off-by: Bernd Schubert <bschubert@ddn.com>
> ---
> Changes in v5
> - Rebased to miklos-for-next (Linux 7.2 base).
> - Folded "Fetch a queued fuse request on command registration" into
>    "Allow reduced number of ring queues", inlining fuse_uring_do_register()
>    into fuse_uring_register().
>    - Fixed retry logic in "Add retry attempts for numa local queues":
>      replaced cpu++ with cpumask_next_wrap(qid, mask) so each retry
>      advances to a genuinely different registered queue (Joanne)-
>    - Simplified "Prefer the current core over mapping" (Joanne).
>    - Folded READ_ONCE() annotation for ring->ready into "Allow reduced
>      number of ring queues" to match WRITE_ONCE() on the writer side and
>      suppress a KCSAN data-race warning.
> 
> Changes in v4:
> - Fix leak of ring->numa_q_map
> - Fix q-imbalance due to an issue in static cpu->qid mapping
> - Performance tunings, like preferring the current cpu
> - Removal of distribution among queues, Joanne had concerns about it.
>    As it is an optimization, it can be added later again. At least
>    most of it was removed, some light distribution is still left in.
> - At the end of the series, add fuse debugfs entries. This could
>    be factored out.
> - Link to v3: https://lore.kernel.org/r/20251013-reduced-nr-ring-queues_3-v3-0-6d87c8aa31ae@ddn.com
> 
> ---
> Bernd Schubert (7):
>        fuse: {io-uring} Add queue length counters
>        fuse: {io-uring} Rename ring->nr_queues to max_nr_queues
>        fuse: {io-uring} Use bitmaps to track registered queues
>        fuse: {io-uring} Allow reduced number of ring queues
>        fuse: {io-uring} Queue background requests on a different core
>        fuse: {io-uring} Add retry attempts for numa local queues for load distribution
>        fuse: {io-uring} Prefer the current core over mapping
> 
>   fs/fuse/dev_uring.c       | 313 ++++++++++++++++++++++++++++++++++------------
>   fs/fuse/dev_uring_i.h     |  25 +++-
>   fs/fuse/inode.c           |   2 +-
>   include/uapi/linux/fuse.h |  10 +-
>   4 files changed, 269 insertions(+), 81 deletions(-)
> ---
> base-commit: 2dcf16d41cc04472a4f9bc6e99d0ab26cfb1afb1
> change-id: 20250722-reduced-nr-ring-queues_3-6acb79dad978
> 
> Best regards,

Hi Bernd,

What is the current status of this patchset? Do you intend to keep it as
is, or as Joanne mentioned combine it with queue add/remove?

We're running FUSE io_uring on fairly large hosts with >150 physical
cores. FUSE io_uring ends up creating 300+ io_uring instances, which
wastes memory and bumps against rlimit memlock.

Thanks,
David
