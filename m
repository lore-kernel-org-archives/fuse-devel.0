Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3A03B443F
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287151; cv=pass; b=ejp4+t/1MtPa3AVRWugkq1cqnpnIhTRxBX0SAkFqhs+WMaV4RRS7tewi3cVTz7xwRisPUe5uecgrq/yU3yeJ5ZcZ+Zf52Y4/dFM1eqqTtn1PElCsIFLnzck+BdFmlsuik/cMEKPJSXcq/+pEEnNMTqV6HL7a0IbWdBPAdIekrsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287151; c=relaxed/simple;
	bh=Y4A3m/VVdXTFKOwxeufw2fY87KlkULF0h8b7jMYk5B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0h48YIRRkMkaTkqCoFyYMsqVEIBhVI32log9vCJa9daGnjTpbMJSZIKO1RJoT0yvYBN92fkDoeHNym9Kjj4FBhoM0Eci3EmLmNThvkevhkRQcaRHP3Dk4v2xGmNJHDOkcjj/7TU8rXhoms9pDmEgGg9PC2rWDg3YbfKTKzLHyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=c7I/82c+; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="c7I/82c+"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51bfbe05683so66165991cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 04:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784287147; cv=none;
        d=google.com; s=arc-20260327;
        b=fS7QL50b1aXiu7qbzIlx1/w+vV+WaeeA1lF1ZtRGE7kl+Xrd7ZgtLvl29JmLJDtHQY
         ucgyQQTYkSbWOLBSleqi1XBgLIXBWEtqT3In6qWDBmPhKvveYH4ig0edZ9XkZm5tiNaR
         DQwpeU97E6S+zUXalRRvXZIvu1EfWD71sKOrRIrOfjHkibp0ZAkA61ha7vwh7kx34n61
         u+j/u6u4ub05wMgkH627pKLU2uT3rNppJ7EO4A8L5B9SEi+IgJmxp95EfDLb/oY+mEBs
         GIUelqu1VPRetVhiRXCJGbKeY4JCYIxvoElWFwW7uMkkwoHhlAwfJBVMJ7wNuSx+uidF
         eFGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y4A3m/VVdXTFKOwxeufw2fY87KlkULF0h8b7jMYk5B4=;
        fh=FnuX5GX1LgXm4nPqySyFKY2TvOspWAAYoOcwtKX+omA=;
        b=svlGJIdz5fkC0PYWA7EV9lPsfYOLPg+NKoQiKogy/Luv4ukkfdj/Fr1jRRWJ98eMMv
         0c+xaYaPx+9kFGHXIbhKq6RJDAscdF57lTV8n03NId4cpi0+KVizNcc3eobOwQRRLC6B
         ri3okh8bDAw3IAoISI543+D+/yLALUSJasuKvh5NS3uh0lU9SAZUO5MD+CmULzYjQ3TL
         l0Z+5H47w37TPtG0DiV+fGFyRpSTzRaCo3CDnPxSZV+WidGjgXRq/d6uEzl96yDc/wQe
         SZmxMM7qTRkzaom2kaT/pnJ2cpSTDz3lUXUvjvrE6booPUO4j2HS5BJ/BIC6JABeGmIg
         aa1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784287147; x=1784891947; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4A3m/VVdXTFKOwxeufw2fY87KlkULF0h8b7jMYk5B4=;
        b=c7I/82c+kTstvlE4oFfZi4bINSWWrqvqDSQD8Z5zIZ+XAqCMHDOOmMRadXvaMRfRgu
         +BX/JvmFM5rLFI6spnRQZAwK+PlHEqxaZ65LA0kjWaM7ICmLrEA8odU6FI4mAAtJ+uRC
         O/IkFuJ0qmnHWh+kFUYC2XNpwSkuH5qzBPQSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287147; x=1784891947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y4A3m/VVdXTFKOwxeufw2fY87KlkULF0h8b7jMYk5B4=;
        b=LgbmxCgpuAiCsDfkkzurKx8ZNhLnTZ5DstzpCecMdHnrN6DHG7iNFdOplREblkHZay
         9zmJEFpKxzLblJMFBUjghWEBtHDXAJHNmTRPR0HU4ZheCFx/U1KNQ5aWGF2mHtMLwHxV
         Y0N6PGuN9728anLct0bQNhmKdwPKksesM5XdJvU6+qojmz/xElCcB8fzKApolhsHEs+T
         NrPCGFxMeIRZtQYKHXZ/SBzSHF0ydLxvTFK6M5+H7zr56nBds4Bo6e2UOJZY7hGnRi8M
         Xn6GxKk6ELzUBpmerTbQpd9gTFBZ64NmDw03a+1m6Df9mVMCD1DN8SVN6BCcmI7IfABO
         CI6w==
X-Forwarded-Encrypted: i=1; AHgh+RoC61M4OU4yxiGv2axsCvJGvC4F07Tv8kWKzPgTViB9wypS4je+6K/7UQdoI0QqNCTZPEpxyYdXTh+l@lists.linux.dev
X-Gm-Message-State: AOJu0YwzNkpAemkhcd0nMwbYqSH1TStdNd6j7FK7dUNaA3XW+7JYb9Xe
	w+g7E8W4cqGhmdIdulvMyK94+9vXamR+tHyfXqHC9XzlVRopTXTo0GhUDAQYdm+0051cDqknoZA
	TcEQmZd9bY2xdqjd2SuIorXdKLvej1rty2OtZwN29Sw==
X-Gm-Gg: AfdE7ckbUjsE6F4MICjfMSvu5lQV4j+2EA5d+j2dkl1TJ3kSl4Vqxzena9Usn0i5Pjy
	NOmHHyK3YW95AfSa86n6likKxkW5e5jkaK5VbA2j7gDfRWb6SC2spEnEFcyufw6RDBSiI5Sqpie
	AgE2eYHLkAjeUBswhBrwOXfjlOM7cPWuMUbF/Ru6np8zaqtPobAsVdvMFmw5x8FKa3Vdorf/Z8G
	4lKZVS5iPpvQ1ZrI2IflMl/cIwc3Xv+A20CmMYMyZs6WnoMWv6nSuu/IyGDoXJy6n3bWuJ/CZXa
	8GWwj+Cu4Q2ApyM=
X-Received: by 2002:a05:622a:83:b0:51c:8fb:fa44 with SMTP id
 d75a77b69052e-5213e67c1ddmr15583901cf.59.1784287147169; Fri, 17 Jul 2026
 04:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716183144.2710480-1-joannelkoong@gmail.com>
In-Reply-To: <20260716183144.2710480-1-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 17 Jul 2026 13:18:55 +0200
X-Gm-Features: AUfX_mz2i4Giuz_CZr4QFGDoCDJ07RN_ZmcgW8KxGdu_-8AasVcvlOpFKwuXyfI
Message-ID: <CAJfpegtUrTUyN5F8yG6Mj92zrUWEbd82nj8rtBLpKqeBeZrjBw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] fuse: fix missing barriers in io-uring init
To: Joanne Koong <joannelkoong@gmail.com>
Cc: bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 at 20:31, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> These are pre-existing issues Sashiko reported [1] on the fuse zerocopy
> series.

Applied, thanks.


Miklos
