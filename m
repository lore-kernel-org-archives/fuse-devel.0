Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9FF37F732
	for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786991028; cv=none; b=mgw+9nWtAPfnyFDRCQ72rwEadDZJIkLbMvBOpeZIbuFj4hwF6EunduAspgair/JK9KsSAPEXiSwORksbBkiIVbA5zP1YcFZr2xpCEiaRJN2x6QOQHYkd9AAEFxiCg1OXaYscgoclb6dutfXOjajTEDpROywaB7+ZjyyolEbyiIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786991028; c=relaxed/simple;
	bh=LVDe64lWgpPCkNreEDf2tLyaHhXxDx9u8aiw0v1yScA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epo6rTI1/ZHR8E2M2gkv3w9vk50maqIEiAOnVgin2Oyz9omelZEvBGgCBtFwifAABjr/a9y+u9MAxngAB1ryWd2WlCK9a3qImJnYXrxQFzbrMHSKM488M4nOLgRr52jJlYQeJHg9zqZTuOdU5K4i97ms5r5N2XXh/Upg32y7rAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Je1ibGyE; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Je1ibGyE"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7eb64085c45so2598463a34.2
        for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 11:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786991023; x=1787595823; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCOP7+TOaVuS+LiopjP3H/CO/x+I5bJYg6vD4bW3O/0=;
        b=Je1ibGyEmDuNTh6a7zm6zLx3f4c9gCKPMDq/AoojUQoDAj/g1Rk99vn+w+8C6JqdD7
         ZSR+wK6yXQKC/sAz7uko0ZZlzImnTNHGA7XCgcYtXrNggnw+lwvSYrD7dfHcZk+i0BSz
         1kph8fKSbZ2qvGok7JA9U5OSdDn2X3wkFObS8a/Na3TKDFz5bJmvQVQNqGvl1X+pQ9rw
         dezrpM5C9uyp5sJv8rGcHwzl9ue0QR1mlnaYHIokIvn3lPL0oO3jRZDAFLQ4cupKXNHC
         fTEHWEe0RdoFR7Z166pESIhOIc9oH/Ku2zcAoZYDZ63ukpbnXk3IADhlbENJA/VQ1oEv
         +m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786991023; x=1787595823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCOP7+TOaVuS+LiopjP3H/CO/x+I5bJYg6vD4bW3O/0=;
        b=RjNwsSYj5PK4j9AL1pZJk4iKfqi2EsoPKpg61yOvOCWsOW4RwartEXyKKMPnR+evAK
         vigvGUeyVXzaaSwewn9+jdbX5a5eP0p8swKNFEG2LEjAZ6Trr8dorHoCghzY6DG7k0fZ
         tyPQnd1VHj/4w34SrmsJXR3yMk6tM2rVwLsmsIOVo6SLkIw2jC3omGLbq9ZWu0kkXbXd
         ku5NZ4Ol1pSGIgHooJ+aLU9ByPLIAJwNZPF2kojFaf3Zws8D7ZyG0w8Uhw1rHvIcCOdV
         tr7KTpZI9MwDkcqCnX1v+QQu1C9OcYIiba3Wk8zonPLBF/4LA0ycYWaHwE3D/oWmF5gY
         91xg==
X-Forwarded-Encrypted: i=1; AHgh+RrMioE+pQpxKEJDfrQBKEjnjDr1vgITwOT62J8KIo+afL+TudfJRuSXDn8DlNGufZWMEF+Nqb4XR4GF@lists.linux.dev
X-Gm-Message-State: AOJu0YzSKrVxt7wH9UonvDvPJbrpVc3dAMq1NTpq8nFOfb+wNSEHhdLk
	ai7xen60Ij22noVy5c9qRHbTCcQr/UDSwXzbg9PXkp3DwShY+lU8dZl+JtDjiZAaiyY=
X-Gm-Gg: AR+sD10/LobjWY/29zB4bLFCZoyYMx4nhniwlgpqzeXivsWkFOC1zndmi5Ho0QuJaDc
	3P0iC4Gw2PdKV0VRcJNczDHqeeZinpqM1NoBGi1mTMVrT1i/P94LYq7qnNm+fqBLYTmO2JwNxem
	81gyb3VZeARM/yqq+47TfcCV0uY6Y6u7VXiGFifSxA+PcwR0J0iv8aZwEOsoICWJToc9WDIzYxK
	/+TeeuCXBLbZyM7a2VNGua2ds55N3H+jox21RW/K3PwiwbD1PwroX0+jXS28cK3FmXrQ3oSN37X
	DRtb6AUUdOkVxhHvNrc/RIwTWgMoOPv2EYZmuhhOJn9PBqPOgaaBLPFidW/muy93cMfUvC5Mjq6
	ViwOzzB1FaNMwdQwiDdesT/lHjypbo1hQnE6yYyu1vUhoACG7R3855PC3+i76JYjUwj58O8rN8S
	lee7C6+G7NNerKADOSuD3VvG4XWck3PzzgQfJAsvuT68YKN4OtnqfT4qsR+QL9UgcN3rE2841Nt
	0Nnhyt0MvqnwwSgCF5a1bjp6jHxHnZps+iFIPxIfDCXbIq3lLWe
X-Received: by 2002:a05:6830:6018:b0:7e6:f31c:47bd with SMTP id 46e09a7af769-7f3de37a4famr26635245a34.3.1786991022877;
        Mon, 17 Aug 2026 11:23:42 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f41c0f35a3sm2024505a34.21.2026.08.17.11.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 11:23:41 -0700 (PDT)
Message-ID: <68d33203-3f0f-434b-b542-d135c39492c0@kernel.dk>
Date: Mon, 17 Aug 2026 12:23:40 -0600
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] fuse: add io-uring buffer pools and zero-copy
To: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, bernd@bsbernd.com,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <CAJfpegvKygVyKMatZwySzqQaS-Q64kjocximitducp9dyBXRBQ@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAJfpegvKygVyKMatZwySzqQaS-Q64kjocximitducp9dyBXRBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/17/26 9:29 AM, Miklos Szeredi wrote:
> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>> This series implements fuse io-uring buffer pools and zero-copy.
> 
> Applied.
> 
> I cherry picked the io-uring patches, since they don't seem to be
> bound for -next.

Right, I had them staged for 7.2 for Joanne, but then wasn't fully aware
(and gone a lot recently) if the plan was to shove it into 7.3 Hence I
never did a new branch for that, picking them from the 7.2 branch is
fine.

-- 
Jens Axboe
