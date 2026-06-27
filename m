Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF02EF66B
	for <fuse-devel@lists.linux.dev>; Sat, 27 Jun 2026 20:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782591380; cv=pass; b=CLajgODPNsK5ADI2Dun9LxA0omZFwkyscFEojFEZRm6obEGyDEvdOqEzx8P+dJaqODZdXuUahQfJGSerfe/tSV8jkwOxrmQSGa99RO1NvYa9YqT1fSNf3McsM3bk8sVRYlMvADWfT4oGmty6rxlBmoo3ZwoE0on+jgdEf21uUbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782591380; c=relaxed/simple;
	bh=vonzgwcAvKWcKi2a1w6ps9/nPtrSl/q6rzZUFJ/WhmM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=B8ESEdfHpFf7y/NznCwKxBO007QlgifvMcZjp8r4kGRD3tuVBAp++hNIi973dU2+F307VXq0MlV0hqF/4WxfXhso9Du3cHGqdFP1izKoqKOqqQfnEL6WAGt7L0ky7s+uXFiVUc3G9BXE1DAiJAJhzp4caqB22VpZjEXCCdacVKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrZcwGBi; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrZcwGBi"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e94d272a86so1495089a34.2
        for <fuse-devel@lists.linux.dev>; Sat, 27 Jun 2026 13:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782591378; cv=none;
        d=google.com; s=arc-20260327;
        b=shGzvRAEE+jtOYfTSesuWU0+6Hz8ipLQE+/TG6Dr07ISQs0Inpmr6unUgptTLKTs4p
         J2VQ3HCpTP1hX1nc8k0ZUvMrLn+IwwyRNTxXEdgk2L/jxnDTNKtVfWC7+hF1xnI/7IV/
         /EH0Y4ikUYiBaOaQcRJK51l8Wq+BUyz3EPVRspGIi9klOQL4ZYnn0CRH9nZ28OWjBuN8
         iZq5LWbC3xGNfdSMWTyRFd+uaFjVQq4JTygd6fSTB7uXhgauRrO5V9YikACmCByrWzld
         vQnAEyTiqCNfLr3zPO/6Jhg4hrTyDWJVUKV2W9LkTHEyd0ggvHz+sXWfIVnRMP4RCCIu
         HYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=vonzgwcAvKWcKi2a1w6ps9/nPtrSl/q6rzZUFJ/WhmM=;
        fh=xwtyyrkCsT3lLu9XkYJPfnIn9Lk/s7ILbJqtz943ioI=;
        b=O/WmQf5X9ONgSSJampJw7JOtgsRUqBey7RjSvSSG00Tfc/XuZaUTZWh5YEgAtJVxi2
         cyKFbREDPLPsnxJjMmdDkbUUAjzzpXmGUMslISJDs/oJYXYlI+eEBvLd5vcVqy3/tnbP
         7Z36xbD/41yKfGpvjffHuuyin+2VKSK+WlbYZq3HarkvRQcqwNMsFtG2dUW95Eqsnq4Q
         0X4dDYRW36/XsJVTk24wDvH9BjaiNKhtlyiC8ukd9odT7ATm4URxMUZXJLrjHxQPpf/Y
         XzCGhbhl90l2oUOusPLap32HLyt0LtkfXRAVWlDa9OcFWO1M23MRSKlewnSAZGWK07oR
         X2jQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782591378; x=1783196178; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vonzgwcAvKWcKi2a1w6ps9/nPtrSl/q6rzZUFJ/WhmM=;
        b=PrZcwGBiHHnMOYerWQ6IouCHRCTHPdxju4z6SrJ/GChL/TaJZSGTgISRDBgKrN+QB4
         sRytBnhIYlWWMCGL3/V1/q7Lv2QZW1o4loUwPJrIGTk5mHlPH0iIf4c/Vy8W22aFHK2Y
         m7n/0ePRG3DN50NjtNnjafniy8UOfa+YShLLXJvC+hf+h0BGghRsE59nWLguFmh5/kvU
         kmGAYqrNCy+oZ3OFFyupByXDtV9lNRy3ZEIjhf1KI0QzRvOq5eLFtxxY1non6oFFg97v
         zSgdNcLZKORGWtduNkNIZYY7VyJmy/rb/6y6zAAz/LK63gR1rlY+PCVzyUHUOcOOeQ9v
         z2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782591378; x=1783196178;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vonzgwcAvKWcKi2a1w6ps9/nPtrSl/q6rzZUFJ/WhmM=;
        b=Td76OYZSaxnTYA2v/BU9fXWMJjZckQMq440Kfuy34QMadaDqg8XdYtsB3GLlGvhwWn
         0h7TYV/4guKhQSmhSL7Xtpx47ExnpJxOd3LWVj5tJSxskqmBTW6Ox7PULGvowb9b0vOE
         cCvtFinCn8R39L/nwhsurmxrlfd89Gd9gDMLYdJU689fgKosOXgcVvYUxhAEIChQ6adh
         grdBWLMjsLJZ6Sgq9pV1WkbKrx4VGL98/D4gyLska5kIz0T497UYuHfcTigo+5wRr/Ke
         cdE6it/+8SHgkkztG3llHY0qiqcA1/R/IFi/DeRTXfDQ3rL9ZkyUFFZMni+MRj6nPIUz
         xKjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tlFZdExHEdhKF8LA1SeD6S7XQOGDyeYP/9YJX3zy+evQ8i+1dgUYbGslsAoqdrsNTsvdJ+ArE1hYP@lists.linux.dev
X-Gm-Message-State: AOJu0YxBfoULV4CxXHNMNzd9E9QKUYR7toGr+LWAy8wj6h4eYRiirpnq
	dNYtsmj8u8GJN1jN653oqIEdr7XikifLPjIra106KYEQ/3LAbAW3Ql+QnOBRe3HsotOjRDbvZT2
	UJkcM2ZWlhnUHQIpoKtv/HIBUHda45s0=
X-Gm-Gg: AfdE7cnI5wZ2IzUqc+1eOdeGs+Xmr4h/rb3pidf6qb+Pe9l8wStc2+A6h0i2pp3C1hW
	L2u9n003oeG/Mow8yq8ZPx06Mw417EHMvq2J51qskg4zLgB5cw2gPuzUDbnHnj6tkqwxuvDdjZo
	QLLEWAdMElbOCg5bNDPcQWAdDD5wWL+GxZ7Y3JBFMpqwtHlAzq4kdqODJUK22KFqntYs8VDuVIx
	skVgGXpT6RGQ49NC0i6nZkA13oOifHqivDZt7Jz4ypYTnJzPls3km/JauKmmnynHM9WQqRV2HcP
	hjcw1wEh6iTr4TT6djW3za21a2E=
X-Received: by 2002:a05:6820:1898:b0:69e:4d9d:5a5 with SMTP id
 006d021491bc7-6a13517f894mr9198416eaf.16.1782591377612; Sat, 27 Jun 2026
 13:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: David CARLIER <devnexen@gmail.com>
Date: Sat, 27 Jun 2026 21:16:06 +0100
X-Gm-Features: AVVi8CfQPfuIJt8FErPt-56LoIHFiiWRe5CaDM20Y0oTUMuqAStt3j36sP1-HVU
Message-ID: <CA+XhMqye_NBihcadRTU=w4xAfrdY9rsMB3oHF5+bwHukkjHMoQ@mail.gmail.com>
Subject: Re: [PATCH 23/32] fuse: split out filesystem part of request sending
To: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	"open list:SCHEDULER" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miklos,

This change alters the pid sent on force && nocreds requests =E2=80=94 inte=
nded?

Previously these allocated a zeroed request and skipped fuse_force_creds(),
so they went out with in.h.pid =3D=3D 0. In fuse_fill_creds(), args->pid is
now set before the nocreds early return, and fuse_args_to_req() copies it
unconditionally =E2=80=94 so writeback, release, and DESTROY requests now r=
eport the
triggering (often kernel-worker) pid instead of 0. uid/gid sit below the
return and are still left at 0.

Looks like the args->pid assignment was hoisted above the nocreds check by
accident. If keeping these requests credential-free is intended, setting pi=
d
only where uid/gid are filled would restore it. If unconditional pid is
deliberate, disregard.
Cheers
