Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E513749F6
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301520; cv=none; b=RB6qfEzBUvpvxnyQkO+wRA5xPeF3liT/TZdmUwMOhUUEIpbM6JeSP1+HG8Mj4m++tVsSD/zxDaUVyAIj2FB9oClU6ftWjaIyhhi+O1NCd5t9urN1Rm1YlkQ02QE/P6AHgS/Zj6m+VlfmERQH/A6yl56Bm/EP7A89UrSMBrpjMEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301520; c=relaxed/simple;
	bh=dVvq9fmkd2LQRsmrHsI33etLU4WRJr5UrfkQR9o3YJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onyvsXdBLNZBx5bgWwgvJeECj73aQFXQHw1NdiwBfwslLOkdi+cERTdaSlZDdry+Ch3HSrwr6Mk2C952Gp+IrAlbFRh1N4Y61wpEcl1epLFi0C7QteCKAwBiP6KJmrZMxebJvftG/xTdBtYKskB0z8JnmPjhOfKczlGh8hLDbKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Y/Xk9NBA; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Y/Xk9NBA"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e6cee520ccso1013130a34.1
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1781301517; x=1781906317; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IfcsOfmsyapNrJWlFk/zWiMsI0R74rTlFfWwPy9k4t0=;
        b=Y/Xk9NBA+U2WCusURC8QRmu2O2iPNZPSCgnb1bEXuDHvWq8gVPsNGjo2NuXjCJ2jS8
         MHFYIDz+ceLIsDx29pJ8+Q3kauDI+PjH/KlLp1oaM+jbrdoYQaTusiAOyaPFUakEB9/W
         aE05FNKOBerXl9cMcC5tHyuzohgF68NibAIbNMvw0CNtPmVaUd3W2GwzhkUHaaPWBK2q
         yAND3ioxWNfTMSB5DmI667qDOdnaNvkkvVowi+Ks5QrYH7w6FiCtenRMAIuF4vXR7UBx
         2ACUuqDq+iXgEhKLg5K2nKPLRlsH3f47eTKezggvS5ZgUWr+kVP+H+zkXdNYvYIjvzhQ
         7aIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781301517; x=1781906317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfcsOfmsyapNrJWlFk/zWiMsI0R74rTlFfWwPy9k4t0=;
        b=h2mAT8HM7VuONwoBxKXAXny/MEPRa/bGCt+qp0s/zP9PkAC/PcBa2UiZLJaqb7BZCt
         OLzTpdGNb1yGNSIfpFoqT1xHL+EewoIVH48JVxJWe8eQd0Djt5jtvCXooOt0LWBezm+/
         zBeV3MPBSOZ5a9NDOJP9MdqIIl2bjpaCfMbn30vz4l/8aYaT5VBkt/ApIqKZFXlUG3YA
         KRfQE2N30y6v6+zreuiu4g3d0/TI1Ec86ACJEF5c+4EhoCCv8pLZlnmzV+p4eMsmm5Cf
         3MiZgkVeMaVMJI90lindcIaS+h735jW+Ekgm9FsMtksmv1NXGItpYyiDrXURO22DojSo
         CriA==
X-Gm-Message-State: AOJu0YzV6GIJZA0x2VLZV3nursz7B9TJPUAq5aTwQA4LFLpTuWNzN9Lz
	63nUqvjeysxZc7/SjKH7or9oUjVUnO1nnxD8CXsiI2gPadpSR9d+pS1jyfqUpkDEZq8=
X-Gm-Gg: Acq92OFqaQPhtHDcFodFmVAGGptDMHxWqLLIHeXBQXXLWsmMnCdoUci0u24CVuQdXd1
	Nm/hze8/W+2DnSu5/cnthsNOFjArPcF4aaYhPxshKlYc3RJJyMv+t+hhRV1SZJ9J844IHYnEwdH
	nq3l/g1EvMcND1xDDZiB7mTi2+ZbOJiHOctcGmup+KqBj62z+/Kq24GYY5lb5MExWL4uhbQM/nU
	coh3qzP3+g5UnEC7d13vsXK0U0TWoOX8j4ffyW2u9ChfPOXvH7CxigX1H4KmbG6zmihZ9vt3aR9
	StVg9NLdxhtKUyg1MTmKZ26qqIVJsLyCsifYLsOb9LTgMBnnwx3wGG5nteMHUpQp46m4nVUdz02
	8ww4+WbqXCwhe/JjqfoIzsE+wrzZxOSSi6Wn9dGEvkpY4Hwf3ypYwDdHGjOTlLvVnH2KmGdbjAq
	Db0HxKfa/tHobmTeGj8m22h4l8IqU7/r/iQyEqmr2m2Io+IHQlYdDMGCVS73ksNoV97Nb7OA5i3
	1xPF7WImA==
X-Received: by 2002:a05:6830:b15:b0:7d7:f70b:5b0e with SMTP id 46e09a7af769-7e784a23eaamr1947644a34.12.1781301517524;
        Fri, 12 Jun 2026 14:58:37 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e78177f40esm2848447a34.25.2026.06.12.14.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 14:58:37 -0700 (PDT)
Message-ID: <04ab6f18-f668-43b4-9e03-f63d45460742@kernel.dk>
Date: Fri, 12 Jun 2026 15:58:35 -0600
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev, jlayton@kernel.org,
 libaokun@linux.alibaba.com, bernd@bsbernd.com
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <CAJnrk1YtpVgELApN4ttFi32UcCcWW9dwv88aJpLwN8C9AmT5=w@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAJnrk1YtpVgELApN4ttFi32UcCcWW9dwv88aJpLwN8C9AmT5=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/26 3:46 PM, Joanne Koong wrote:
> On Fri, Jun 12, 2026 at 2:06?PM Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>> This series adds buffer pools (implemented internally as a buffer ring) and
>> zero-copy to fuse io-uring.
>>
>> Prior to this series, ents and buffers are tightly coupled where each entry
>> has its own dedicated payload buffer, requiring N buffers for N entries where
>> each buffer must be large enough to accomodate the maximum payload size. This
>> is suboptimal as most request types require vastly less bytes than the maximum
>> payload size and some requests do not require payload buffers at all.
>>
>> This series allows servers to pass in a buffer pool (internally managed as a
>> buffer ring) that the kernel will use for servicing ents/requests. This
>> decoupling reduces the memory usage requirements needed to use fuse-io-uring.
>> It allows for future optimizations such as incremental buffer consumption and
>> supporting multiple buffer sizes per ring.
>>
>> This series also allows servers to use io-uring registered buffers as the
>> buffer pool which eliminates the overhead of pinning/unpinning user pages and
>> translating virtual addreses per i/o request.
>>
>> This series additionally adds zero copy to fuse io-uring. The server can
>> directly access client pages or page cache folios without copying data through
>> an intermediary buffer. This requires CAP_SYS_ADMIN privileges and using
>> registered buffers. Zero copy (patch 9) has a dependency on io-uring registered
>> bvec changes in [1].
> 
> Miklos,
> 
> The zero-copy patch has a dependency on the bvec patches in Jens's
> io-uring tree. Since the merge window opens Monday, it's probably too
> tight now to cross-coordinate this for 7.2. What do you prefer for
> syncing between the two trees? If Jens stages the patches in a stable
> branch, are you fine with pulling that in and then applying the fuse
> patches on top?
> 
> Patches 7 and 8 (bufpools and registered buffers) don't have this
> dependency, but to make the uapi cleaner under one single umbrella
> flag, it would be better to co-ship them with the zero-copy patch.
> 
> Patches 1-6 are refactoring changes that have been out since October
> and have value on their own, independent of the bufpool and zero-copy
> work. Could you please pick these up for 7.2 so they don't have to be
> carried and repeatedly rebased?

FWIW, I reviewed the patches again and they still look fine to me. So
the 4 io_uring prep patches are staged, they are in my
for-7.2/io_uring-fuse branch. They can either go in for this coming
merge window, or we can carry them forward if fuse isn't quite ready
yet.

Since there will be conflicts with either the io_uring branches or block
branches, the above branch is for-7.2/io_uring + for-7.2/block to avoid
that.

-- 
Jens Axboe
