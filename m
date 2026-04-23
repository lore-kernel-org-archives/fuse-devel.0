Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690262D0C97
	for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776929544; cv=pass; b=bjPRxSd8MCn42EQ0KuR1QuWw6aaVLo2vNlRgzZvuM3frmQqIXSCiWCIBo76f/mCQE1lKY1hMoWI6JTBODHkWM2zrW0U6p2qD0CURI6NhClNbUd4hQ75yy5Ovq7rZWDEtT/zYnHvUxjG9Tm20ycAKe8q4S+d3KISfrlE9rMpFrQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776929544; c=relaxed/simple;
	bh=IpohdUHrqp7Bcpsv6ZOtuAITGFOK2N+08ThfiOE7Jkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omV4ZQxcBYqBV2bjsAFFxoDHR/Ae3YCUe07QlBAs7/onrOUuy9SLFuoGZV7RMm0FJAXcxCozffXhuFsKUtqZfNDLxBGx7ViJggUIjbrgdnPF4fTPhJMa3w2HfjHs0qVgsEaLE76ayRD4P16lK4KzW+U92h3oUckD3bsh0HXeUNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=fwAjG4G6; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="fwAjG4G6"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8aca6bd57cfso60761136d6.0
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 00:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776929542; cv=none;
        d=google.com; s=arc-20240605;
        b=fE14OxpiGyNgDsGOWAyp7XQgn3zZ48/IGiT+mhunvDsr6BN+c05PjdUlTwdQgRwDTq
         zYDf7GbmfXAq3jTnrL9QtLnKjmLwqChq5Xi7jwZlakXfLtMv77TI7DRCs8ZfqARLP88K
         0yf7HSA+0VnBVtTmDiaY6Cobqg2/PbP3HDrdTx58EUSdWn676pmxsc/w5PagUQAA3xHX
         1mRtsfLMZFqcPQ8brqbYDAlqN2dgERSPbXauA9cVQfhmGwLrrORbwAC+8qIzBBhpHJvE
         cL84YusFQNpVrgMWelrUBQuvmCT4g8dMcvx5rHSM6FKB13N+7d+E/LcssiAnJuGYzxdp
         DlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IpohdUHrqp7Bcpsv6ZOtuAITGFOK2N+08ThfiOE7Jkw=;
        fh=FjmBLi1acZBlPZ22okIzucqNBtlZyqZoqzIxyMPrI5w=;
        b=C+YMrTw3bQ2hzcfT81laOlJFWOf7PIVkiUXEdnYZ/7egs7vPJgrdQkbWofu7+gHBmk
         bBPPRiPpEaMdPjRqPShJSjGgKwzEvSrbXIR1DhNHsmhg/VKoa2mcFv3/P4XLUDsqJW65
         MfIacXn//KfjIrEMVhprpA6SQ5gHuUD7eblTqmoNfR+AWeT7oksBlZlwBtLsnndJ2M+G
         3UAvB0N1BHoXVTESEmbJFQlQjsFXM9GsoMv3LSQ0GDA3rKd4v6daC+4kGYmjNnMauhh0
         UYQk52p1YaE9gB6wrC78lPnYW6mWtGM6bscmho2jkAxtSUEZhoNUFfZJ1CkmSJqjhuo1
         L7NA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1776929542; x=1777534342; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IpohdUHrqp7Bcpsv6ZOtuAITGFOK2N+08ThfiOE7Jkw=;
        b=fwAjG4G6KYwtoj7n7YAVN1gQxfqvBwbIchycxkdx7lON+luu2bJjxEt5U7UKqxQUih
         x3b8oOik8HHvsdyOVoLFqb7EmuMXKWHpG4CbEJ2N6hPyVhl55cjlf0Liobki5XeYC8yC
         q6q1fH1gn+9rDJ71NI1ORJLGJklEJvf8vlb+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776929542; x=1777534342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpohdUHrqp7Bcpsv6ZOtuAITGFOK2N+08ThfiOE7Jkw=;
        b=RveI4IR4w6QFAxKh4jZCnfO7fq9WA6DRsIzf5al7Kf04ARh8q8hUXJsIHO4QvsCWFF
         /Kcow5Xp4bcqkWRNdTADGXIaIT2ztkaWAIQyoorHnC9E9uDtuKpHyvHIlQcbicrvhcQs
         SgYbg27oyNDMdD2RVJZiEP8ePJ12iAHXYCgbQK0pzgSQK17EHl5iIej37HIIGQwSEOyE
         Yd8LFRsBVfiBzwISvUSiIczbDlom/HkoUgZDEsKhoHg9aZ7SHFpuMesq7KLOWH8TCgYS
         r7iaL0edlcRWB4shphl+SyuHC9dETZOJEf1FX9mfbPyE3Sa+FAAd8I1KYsmAgWSqR2i4
         vG7A==
X-Forwarded-Encrypted: i=1; AFNElJ+WXGjtKJIC/Nzo8dXsFZrNcGI0EkoNBdJuek8LuIT4h/OMWniS+F2KjjDVpJ2qSddUucS2TTkatd5/@lists.linux.dev
X-Gm-Message-State: AOJu0YwWI5ahEcpZ6TmYJVz5ulKyOOstUIUfWKLy191Qc+0KvVIgCVTm
	I94vNHwmHuI7M3OUsm7l1LI5zojltIFXXLZ50Cofc1GPA/THezabBXfe7NQCX4zyaJhJLxF30RC
	wPEUzaApn7FUOztjjfD1F9hFyFMGQ92BPqcXqCekt12+/ncSoM45j
X-Gm-Gg: AeBDieucx1WCJhEdBqTGRE+dOkUGjM9l/1NJYgOZynsylXrpOOtHwdDPEXjExUEh5Pf
	+oLHlRT++B8GTeKsNhsYmJ4Ifq/TvnxRHx2IASTs2CEupRQxrgSqtg0CaCkO252GXaO+wekqn89
	tOllUEbN4TPFzbodslm1GE+5pdReK4OA3RpIay5Erk/uo83AtaetkrdxWuq1oiCLP0O6nNGijTl
	+TaO3m9OjxC6mWo9QjDHZI2bdGtBaD5+haoaKM3LBkxfqNyZI8igL4SaTWIUko1yZHQyAasmuHE
	4Od52AkSsywUqc/1nstsmOdmM9jo29fZY3GtINs8UcyMaN8KZJk=
X-Received: by 2002:ad4:5f8e:0:b0:8ac:a82c:1c43 with SMTP id
 6a1803df08f44-8b02813c979mr422929336d6.41.1776929542373; Thu, 23 Apr 2026
 00:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420030900.4944-1-liwang@kylinos.cn> <20260421033816.6546-1-liwang@kylinos.cn>
In-Reply-To: <20260421033816.6546-1-liwang@kylinos.cn>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 23 Apr 2026 09:32:11 +0200
X-Gm-Features: AQROBzD8W1q96l8SQctD59yW8R_KX0xeccUZU2-An1mshUChheb41Gvv1o210LA
Message-ID: <CAJfpegtwiJaaxqa7kS4TradNuoggx0HBK31qWeu8Ks8zEkOzbA@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: drop redundant check in fuse_sync_bucket_alloc()
To: Li Wang <liwang@kylinos.cn>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 05:38, Li Wang <liwang@kylinos.cn> wrote:
>
> kzalloc_obj with __GFP_NOFAIL is documented to never return failure,
> and checking for NULL is redundant (__GFP_NOFAIL in gfp_types.h).
>
> Signed-off-by: Li Wang <liwang@kylinos.cn>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Applied, thanks.

Miklos
