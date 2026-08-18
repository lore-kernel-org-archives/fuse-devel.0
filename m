Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDD733D4F3
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056569; cv=pass; b=YM1DQ+R/hvnDlqGux2oEEQkkAGYG2MxOXqWW0svULv1jkbmW46LEg6R3aqPGS3G3HKDXcF2wwOHLbsPCdtEIE5jb3C2gsr92IgzUp5jbx8Ez9TeWfIg6wdSdXBYlxF46u6wvnsorbt2TH+f62WVyEshdIQMSkPXaMHrNoOtURl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056569; c=relaxed/simple;
	bh=ETWdjicKP6/sgtipwUhvvJOJr7VKLNNHS+gpQUZs7s0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNfBxaNl0q06OMZp2CzfYj+BsKc73HGjSy2JDlMEprhrFPv9wPoxwCWNIY5Wbhn1QcAzRho+5LTVMsPTa8LFWHQlzWmfKJX/g2uSwP9PrXdhO2XxDrMkAMjLNQNyKgggrYx5T2pQUXGRDgVkvVR1T+C/3bTbWND8QM5VdaDLti4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=DN7VmiWp; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="DN7VmiWp"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92ed3993c1eso241942285a.1
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 05:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787056567; cv=none;
        d=google.com; s=arc-20260327;
        b=kUxZSGdQ8sjZ2qdmPC9jrJpoERIih1yJ2reWlHjzzWfqoFLuJZL23D7/C77/kWqFQC
         SUv6RJUJTs1zM1HAdcQnS4+Muda2UadNHtMQkpbti4tFgA6Zd00fTQ1RQOqDP34KjAdn
         iJ4YqhOccLa5u4RxcgLMeZLmApabew6XHAfxhELXemTcGXYSxMBbUmUzyS+Pyok33evS
         se1jFZRypwm2f4rl9myrtXxaCCIQ8s5B1LSXnClf2ghhcQcOXgGN4LUIbIuHrg7jcOzv
         FegeuSJAMWaPkePAXH3XcPq2dAxllXe5G7WogbE299P6HPA/v+FhAh8o+wgqY78D5qa2
         aW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ETWdjicKP6/sgtipwUhvvJOJr7VKLNNHS+gpQUZs7s0=;
        fh=XB99xyfbmnZ7pJC6z7YLFi37XzcwjzqnN3w6/rJ4qGE=;
        b=gpithN9qMdu/9K73uFsuYBBUBbXE2faj9CqlTI2B2uRiRPgvA+VYWP9mjgDhcWDYKk
         iEEXsv/NYGWgwIs7KzM+Jt/PzKC+1Rr1S4q1y4LW+a06lQiAq0GiD7um1TwwBiSYMbI/
         5dfRt/phco/1nmS+gV5ZDxTHg5eGdSZg+VLIbgoYUTj890tm40odSB0aC/ZFLLUDMdr4
         3s0UsPW9KdqYrA4RdY6JUjtn8cdW5nlUJKwJNMFX3h7txai2A1n6gLwutzLLxzWODzRx
         b6hybAuNslaCm1ZidEKDidZsXXMPipbDgJ1O3JGf+OtEFKJz32tOAWzjoS+RXIGSJcoy
         F6Ug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787056567; x=1787661367; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETWdjicKP6/sgtipwUhvvJOJr7VKLNNHS+gpQUZs7s0=;
        b=DN7VmiWpGsJ1c2hXArxLA4FLYKgoETRtiA7MEuukJYlvEa0rep282551DJev7tpBgR
         ullepraEPsolM1kl3m7ze+Vn0qOl5Ptt9iityPEIyxCKz98FaZwzleH9ziqP0SjYAMkY
         og5PbdpsD2RGYFDEH/PZ/7/k2KUpkfuqcyIao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056567; x=1787661367;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETWdjicKP6/sgtipwUhvvJOJr7VKLNNHS+gpQUZs7s0=;
        b=Ejygw5nRCH0cJRxlEfnxs4K+HoaGdO9M+PZ1bAGDfJqBdXnEr9+lXfu4sOA5j/+5hK
         RIqUkfFKKEhSPOca46vLL/Uip2pzOiRNvH5gE+qPpHe5l3dxlwvqtsai/HJoRbqzJuzW
         uAKmXwwwnZluLGvl0jnzAvroSrJQcvohGISvw+SrDd9+PngIZOymIpJpc5BUc4/ex+lo
         AXJ8/J919sUa+h7frryEDMTiQdR4u4qpOTBckcOVpxuAUIArPpbV9izXFIaiRdFFYR07
         TCEHis2mGSeajq4BVEOkFNJcxBXCTKmeOZsA/HBvR2PWtFR9NyjKG5PKtQKxltfdpdg4
         ox9g==
X-Gm-Message-State: AOJu0YzzSFD9rrYSByub4d5WjlRG8pouYutgFhDqfJwwgaK7DKxypEqT
	/kDOzI+H9ReOkOtS+zUVdvE098LVN5xlehUm+G77c6gc8G9GjEw0Od7IMcbU9PrFenH/ZYJUUs4
	otS3KcwK7kPBW7RvWA80pWqx0PpnNH2qjfMhW36m3sw==
X-Gm-Gg: AR+sD12GAApsKSksdZgtyDOvNm5YVRKVYBw/52Bgybsk38lzaUSAKOHV8mnlRhM3yip
	hU7RtiC5m+/GwNTQNsYEGWL+nRJB3rGUfxZDGC/2zADGmAOUFoPjWeazGGdNAQbGwM3xzuakSvj
	GaG5rQ0gP0egFo+Ugg5Au4PQx8H8gj9joj79zQFv8UFS/dhMjtl41dQgE41QH077bBjzmkBn4dg
	jkkvwOPp7UVq+I7UyK5929BG9hqR3iA8YcwiBCsi0Uydxpgpm16m8M8te1hRqcJYloX78JWRgP2
	nZD91jJ1gZByLsa6N8ldK0GbWflKgUJub3L4ZtWlknYn8ySVqbwTXTuafUfrWhQ1FStS1P/yy/0
	0
X-Received: by 2002:a05:620a:1d99:b0:932:de76:badd with SMTP id
 af79cd13be357-936d2322c15mr2793871485a.32.1787056567096; Tue, 18 Aug 2026
 05:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731154440.1117457-1-ekffu200098@gmail.com>
In-Reply-To: <20260731154440.1117457-1-ekffu200098@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 14:35:55 +0200
X-Gm-Features: AcwNN1WE8GgGF8U8-Eg2nzvaVCqEMG1HSZDMUA1PBV-fzYgoTJ3AkN2mCUx5b_Q
Message-ID: <CAJfpegsuRD9s5aD5Zy+zKEQjKkV6+eQjJVS4RshcwWwiy2fVJw@mail.gmail.com>
Subject: Re: [PATCH] fuse: use min_not_zero() in fuse_init_server_timeout()
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 17:47, Sang-Heon Jeon <ekffu200098@gmail.com> wrote:
>
> fuse_init_server_timeout() limits timeout to fuse_max_req_timeout with
> the same logic as min_not_zero(), and returns early exactly when the
> computed timeout would be zero.
>
> So use min_not_zero() instead and return when the computed timeout is
> zero.

Applied, thanks.

Miklos
