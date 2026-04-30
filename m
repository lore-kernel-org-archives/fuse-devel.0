Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD4E369236
	for <fuse-devel@lists.linux.dev>; Thu, 30 Apr 2026 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777552305; cv=pass; b=s34Hkk6MZkpjaNkyknxh6E5FHfZX1j6J7ZRkIstV6xwV7hq4pqVlnSP5TOMF5FBOBJoEyt26DfYgaON6K3qGI/PCC9xSuaM/sZ1U5SPiQhKBsMzcoZ29PnjdxL5+3OGmBtE2CNNJjW7c8C142iGKxgAYetRcQT5mVuQgCYG43jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777552305; c=relaxed/simple;
	bh=WN0x95NExmE7JDNT+N8NAeO85nt9ziso3jZuDlmlRSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPKmZH+W3qixdpD9gSN5wQFGf/a6o3SrFxH0pO5GRYFnpED72cVDreKiK36kczAVYfBmMnbrqLsyap00GSFqcTaU8ElAEXE94flUSJTNBmiuSv/gw6QBB/YaA30S0ESMl3LMKoYMRiTg6b62FWDaFkF05k1z5Jj7bTQiqIMLzH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=I8Ah4oAo; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="I8Ah4oAo"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50d75bfb259so5189281cf.1
        for <fuse-devel@lists.linux.dev>; Thu, 30 Apr 2026 05:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777552302; cv=none;
        d=google.com; s=arc-20240605;
        b=RIj0A76hv9Di3sp6nm0pRzddI7CuE9xGB8uhyUZYWxkHxAlhN+PC5pUPLniNsAVSEQ
         M22N5U0wQ7QUcFg0lFevDO+L0H6r/4XWd39kywu0YC3FRJ2RksD6ZBt6VabmhDXtcQER
         +RTjxChkpUlsi114o+XqPJNrhrisgqVrixWzWhYwg5HXj8gxtTtjjRaKwZMO3Ai4QGY4
         3a938IJHLJslQcyJUwQHBfw0h2VbjbtUcUUZBXAKy6z2xQB/bF36rNBvrN68SRC4soNL
         YhXarFJkR6ryYkSlosUfsII3HNRWGUIovJz4xHXeRACPCawLbf2i11N0ws6zMyw5ljoa
         0H+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WN0x95NExmE7JDNT+N8NAeO85nt9ziso3jZuDlmlRSo=;
        fh=stTYHwfkqL7OQmZ8JEeEupXdsfMi0BmvfZACPnh1mvw=;
        b=fA1f4XORABeWAJf7/JCZd6nW1RkVVKc/Ei8tDzbUEBmYKYbBPrzMLl0FYcV9OgRkIW
         nMio2ykyyCTykadO42W9ush2c5L8pMF//SayozVnGAwkebSHauO/kXekpi0hUG+Nc94t
         7lYJiRgqgVUm2NDtkVX1oPbObbbWTDjYDPJ66UiL79YaNbrN6L7UGKgc+YkbKP5N43rT
         PVo9Y7j2iHVqvnh7RAyEhd5qBR/q1aUny+snB1ZwQFHiL7scjqyLjs7yBjhnH/3ETkXc
         D4gfbmQbKA/w+oAyvEXxYe8cmjbZn2gqX8ZvRTvXu/7gOvk76lPiXPfua7N06Cf/Hsnd
         k1iA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1777552302; x=1778157102; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WN0x95NExmE7JDNT+N8NAeO85nt9ziso3jZuDlmlRSo=;
        b=I8Ah4oAo4W4Z1omVE+3C+6OSM1ovQBIAK7c/UDotzq2hkuWK9BKjfMtdoWCRQRptB2
         ovGoCFOsWYETyoEEeBw5AyZUCQPbX16NzoWWNeg02kY+xV/x5Uw4KtV8T509anuiqfmS
         nQfrU4B/Qi5LTbbbLAiK1zrN6aMoTi2HpQOLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777552302; x=1778157102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WN0x95NExmE7JDNT+N8NAeO85nt9ziso3jZuDlmlRSo=;
        b=TMqS8ds9XIjLuiHJ/Fp9H4FDGfRvDCm54swWF3MH4Ou6q3VUW9Xx0a7mGxnSI2KpdQ
         Kg6qAapez3ZbSZTEp5oJrA2MATyrb1v4gfBJS/fesDzAUQcfJ10Wu5IKKIuXBpY6UgA/
         NDh4gp94mpnvTb9VEmNUWvbsUKqJ2ojT2LE+Ydf5r4ZrOQa7As8S8VnjO8CEkXCVmDRC
         H29dra64SydRBR/c1T5YX2s9i2YRJFsewsQh3ATyD55RLdz+fYu6eEHRCT1zjP7zW8be
         UxjmOusNzkKb03FeM/ipJCzih47vbOhf3GZ9xat/W50Z06hQVdswz4UDpfoMnyWWTckg
         YcRw==
X-Gm-Message-State: AOJu0YyxvdTnSiVc0JKguym3eEeK6bsVjG2XhZdemoJW1mKtokVFTx7E
	lBNZZw25hV6v0zTGrnuolBtYZJlqSwS/aWv9+Ql3wMRtyCaYl81Why7bJ9l/+RxZexdgyy6gNsH
	osl/o7+CGdUI5t2E8oPnyS1w8AGzY4qqfkMTGdO4Zsw==
X-Gm-Gg: AeBDieszdwOME5Ov0aUcx3le97Xl4vJsI+ku2AkYpfd1qfg9YJWwHhmLl/cCX87mUAc
	jpRqI1F0OUL0551XS+MdKYJFdu2A7tGz8iPyNTJHlJBaX8FkjhrZCba94ej1NQDvsAZdiUWMaOb
	DVjLZV+w++zaEj9iO89wKtwqPKgMugQN4ggRlXH+d0nitQqJaj4pFhfp2cp1GKEJF6bNiBlf6ck
	b8ti6CHYycATLW5ByTqrRXHDGAugHFTvPJ6bGFHU5wiNNDPcBBwzE1KJDPgeotjTQHclS8eV/8k
	Gy2BsNIckuSii5mGYiZX+igQDgz0nVtBw35PBk0ZUuCzGGXMNFA=
X-Received: by 2002:ac8:5c88:0:b0:50e:5ffd:dec2 with SMTP id
 d75a77b69052e-5102ab1bf61mr37571081cf.1.1777552302038; Thu, 30 Apr 2026
 05:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430114746.2196348-1-joannelkoong@gmail.com>
In-Reply-To: <20260430114746.2196348-1-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 30 Apr 2026 14:31:31 +0200
X-Gm-Features: AVHnY4IEOtJVnefBL2LNZtmOmHydyzo3igca2FQXo0EoWU9XeukbNp42hdGSd2s
Message-ID: <CAJfpegu0Lovpv2FR9cJG6QjV3eD_yDm8ZedQqymM3zACwG5mPQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v1] fuse: remove redundant buffer size checks for
 interrupt and forget requests
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 13:47, Joanne Koong <joannelkoong@gmail.com> wrote:

> We can get rid of these checks.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Applied, thanks.

Miklos
