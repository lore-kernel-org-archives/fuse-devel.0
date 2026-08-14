Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081730D40D
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 06:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786688386; cv=none; b=pwZLy5TI1+somTp8JhiXIDAGtsUC7TIiY0nC538aaZuKd9in+9oC1DHNbcx9eaaHteV4s6TPZYkw9LhlCTQNcS5yoYhJP/sPHMM3M3lKDYCsTvdUe5YRXiUHzx09C317HXIcHpqvFlnuATbX1szqUpv5ay3SvAQ+6XqLCvLedQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786688386; c=relaxed/simple;
	bh=KFbfKvgkiUh0eoArZY7l15PSg3pn/R5+srLV0KmzU3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LYnVC21ZljMniqNReLwKbve/Ek4L/ZpvIWmBrVDgUCN8cHGTia84McQRoWjQ/u7J/0FHcVX24hy8zrQDNUSJG4fxaa6lt4D/MgfYq/UGKMa3DEiGrjy2ekZtJ/X52yWMcKl3CcJGOOjRIxDAJhxIVoZF1/3mniIZ+wBXTjOhHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PybQ81JM; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PybQ81JM"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso622545a91.1
        for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786688385; x=1787293185; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zzHteahxWER+bHLxgDmoneuuL+9/H/S/HBeqpOauBo=;
        b=PybQ81JMDY+iq4qgztv4NelvziP3DrfMIABTPsCY3zbSBTS5agJ2by11C2S6r8Hvn9
         q3Dy3DkEvea8gGkoiKT+iljwuP+JsWyrUlc6YUmtVMj0b7HhMcsJR2g+iuwxP3QMpNAM
         XySOQvDwFxS+Xj0KqoHcoqdM7G9/HlOaeqvbsJpWP5gYiYdqftVMwtsr146VIZ5H2xmW
         GAHJajwCmp8dtX6zSroSe6GoSxAcgvYFQqW/w+mkeTikvTWeEmQU3+bzZlgmyd6VZAUA
         darFBOLEpTO72rKVuIC3wt33g8/k4WAnI7xFbnd+6drmBKJgCrN8n1WjKd4hwUOHdxWD
         PRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786688385; x=1787293185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8zzHteahxWER+bHLxgDmoneuuL+9/H/S/HBeqpOauBo=;
        b=UnrE8r4L66VBWsfJcrzPKN49SleN+9QNb8NqxXo7d6ON+bRyQk9qQq5tXmd+mj1IzS
         bxLgBxhz5G0vCt8yWTMQaG6fJvsw3KEJpRr2tksyEUeOoZ4WRNKsYX4Gh4SWxAqoA74b
         btt2tDATIfGZwrTmsX88lxxv02oqbtqAxjlr1STgpmM5/83hps/ZuQB0+E3JGbCxbiHA
         8fgUlpRsSOczyG7bFgh0brCtjZnf30T/yUtdUqV9STscD4Suvwr+CC0IAYCe0Z1g/lGI
         bGkd0TqcleaFvugzXqnRP0A4M1qpBaWvRzxcGfyN0ftWGp9AP8kGBaxRZWdxJtsS/xAg
         /pvg==
X-Forwarded-Encrypted: i=1; AHgh+RrrPFMkGzYtySQl0lkCSGohG4kG1Q2oLv1ATuObkDEL9g4wGz6N0fgEH6Xi1DglAQZmvhZZqyWawyie@lists.linux.dev
X-Gm-Message-State: AOJu0YyjclZQ3UxIuxl1nl9/NkoBCfKa1cdXmYll1heonthMT5cPPfqa
	gKCV3bGrDP2pAOyrBSLJ6S+WlTQx/btJGTURE3/B3dD8Jny3p5wcRv+d
X-Gm-Gg: AR+sD11T7WZohI6/zjPEh9jsstrkqqGaZ13NskROuaFqG/o+JAQWJMZqrTHgHc8EF8B
	Z5ANlHq7nNTtAyKBtxnWuV4pN5wiCIVJIvD9bHSlEifDOznUY+Hgq7Sc4btjdNUzX0qwfIaRuTQ
	gQeBqXdxZQx5cJjkx4XyBIKDIvOPkIVvbHzoZLsu+Dv0KbfQ7ZpngXq2QJgWTH9KXqVbW8yWg5H
	FrJpvYYYJsXdQs7oQEwvxvIbtpqJ619qPkww4EPwRptbKqJz2qSSJMl9jRb1kP21/TrEhnEWhfM
	pBWMxCN37BMwbKbYvPNTYQNyRjF99T+q24hP8I2AmotGzTLsJjy4TEsKKLnaKVL4GrFqM+ir/t3
	sJYwKVqJ4r6eSismSg8RPjuS17T7TepNXadbfhyFsTePnUCZLaNBFFHm2pAkbCcIJsMbQVruqT9
	dcrv9LVY4FN/exxbj77NATVb0zsdqRkaagLo1uAYfvKlXFn+C/RhifHnyZHaJUBHKDQTkCE9xD7
	zF+nS8Ikg==
X-Received: by 2002:a17:90b:5450:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-3933ed23db1mr3617266a91.19.1786688384548;
        Thu, 13 Aug 2026 23:19:44 -0700 (PDT)
Received: from [10.22.68.200] ([111.223.92.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b688035sm667180a91.3.2026.08.13.23.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 23:19:44 -0700 (PDT)
Message-ID: <1bc066fa-ee8c-426a-9c63-b0ee305de5a5@gmail.com>
Date: Fri, 14 Aug 2026 14:19:40 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fuse: fix request lifetime races in the resend path
To: Jun Yang <littleddfu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel@lists.linux.dev
Cc: Zhao Chen <winters.zc@antgroup.com>, linux-kernel@vger.kernel.org,
 Jun Yang <junvyyang@tencent.com>, TencentOS Corvus AI <corvus@tencent.com>
References: <20260804091757.503476-1-junvyyang@tencent.com>
Content-Language: en-US
From: Tang Yizhou <tangyeechou@gmail.com>
In-Reply-To: <20260804091757.503476-1-junvyyang@tencent.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/8/26 5:17 pm, Jun Yang wrote:
> Two fixes for races introduced together with FUSE_NOTIFY_RESEND
> (760eac73f9f6, v6.9), where fuse_chan_resend() moves in-flight requests
> from fpq->processing back onto fiq->pending.
> 
> Both concern the same invariant. FR_PENDING means "queued on fiq->pending,
> protected by fiq->lock", and it is what fuse_remove_pending_req() relies on

Hi,

Currently FR_PENDING doesn't mean the request is protected by fiq->lock. It
looks like this is your solution, so you need to clearly explain why you are
doing this.

> to unlink a request and drop the queue's reference. A request on

It is unrelated to the queue's reference. I think you need to check whether the
AI's output is correct first.

> fiq->pending can therefore be released without going through
> fuse_request_end(), so anything that sets FR_PENDING, or that leaves a
> request linked elsewhere while FR_PENDING is set, has to be done under
> fiq->lock.
> 
> Patch 1 sets FR_PENDING under fiq->lock. fuse_chan_resend() currently
> publishes the bit while the requests are reachable only through a
> stack-local list, so a concurrent waiter can unlink and release a request
> that fuse_chan_resend() is still iterating over.
> 
> Patch 2 re-checks FR_SENT under fiq->lock in fuse_dev_queue_interrupt().
> Its callers sample FR_SENT unlocked and fuse_chan_resend() clears it under
> fiq->lock, so a request can end up queued on fiq->pending and linked on
> fiq->interrupts at the same time.
> 
> Dependency between the two patches
> ==================================
> 
> They are independent and neither supersedes the other, so please apply them
> together rather than picking one. Patch 2 does not affect the unlocked
> FR_PENDING publish that patch 1 fixes. Patch 1 cannot catch an intr_entry
> that is linked after its locked walk has already run, because that link
> happens once fuse_chan_resend() has released fiq->lock. Patch 1 on its own
> also makes the condition patch 2 fixes easier to hit, since requests that
> would previously have been torn out of the resend list now survive to be
> re-queued.
> 
> Both were found by code audit and confirmed on v7.2-rc6 (075b74841bd0),
> where the series was built and tested; the resend and interrupt paths were
> verified to still be exercised with the series applied.
> 
> A KASAN reproducer for this issue is available if requested.

Since you have a KASAN reproducer, please first describe how to trigger the
issue and what the symptoms are, as a prelude to the solution.

-- 
Best Regards,
Yi

> 
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Signed-off-by: Jun Yang <junvyyang@tencent.com>
> 
> Jun Yang (2):
>   fuse: set FR_PENDING under fiq->lock in fuse_chan_resend()
>   fuse: don't queue an interrupt for a request that is back on
>     fiq->pending
> 
>  fs/fuse/dev.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 



